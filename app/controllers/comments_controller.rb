class CommentsController < ApplicationController
  before_filter :get_parent

  def new
    @comment = @parent.comments.build
  end

  def create
    @comment = @parent.comments.build(params[:comment])

    if verify_recaptcha(:model => @comment, :message => "Oh! It's error with reCAPTCHA!") &&  @comment.save
      redirect_to post_path(@comment.post), :notice => "Thank you for your comment!"
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

  protected

  def get_parent
    @parent = Post.find(params[:post_id]) if params[:post_id]
    @parent = Comment.find(params[:comment_id]) if params[:comment_id]
    redirect_to root_path unless defined?(@parent)
  end
end
