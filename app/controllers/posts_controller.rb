class PostsController < ApplicationController
  load_and_authorize_resource
  #before_filter :authenticate_user!, :except => [:index, :show, :filter, :feed]

  #$THEMENAME = "greader"

  def filter
    @posts = Post.tagged_with(params[:tag]).by_date if params[:tag]
    @posts = Post.where("category_id=?", params[:category_id]) if params[:category_id]
    @posts = Post.where("title like ? OR body like ?", "%#{params[:query]}%", "%#{params[:query]}%" ) if params[:query]
  end

  def feed
    @title = "roverway, about linux, ruby on rails and something else."
    @posts = Post.order("created_at DESC")
    @updated = @posts.first.updated_at unless @posts.empty?
    @author = "roverway"

    respond_to do |format|
      format.atom { render :layout => false }
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.all(:order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }

      format.atom { render :layout => false }
      format.rss { redirect_to posts_url(:format => :atom), :status => :moved_permanently }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
    @categories = Post.select("category")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    clear_unused_tags_with(@post.id)
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end



  private

  # a fix of acts_as_taggable_on, aimed to
  # clear unused tags
  def clear_unused_tags_with(post_id)
    taggings=Tagging.where("taggable_type=? and taggable_id=?", "Post", post_id)
    taggings.each do |tagging|
      unless Tagging.where("tag_id = #{tagging.tag_id}").count >= 2
        Tag.delete(tagging.tag_id)
      end
    end
  end



end
