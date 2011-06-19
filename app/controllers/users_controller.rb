class UsersController < ApplicationController
  # GET /users 
  # GET /users.xml
  # GET /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.xml { render :xml => @users }
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @user }
      format.json { render :json => @user }
    end

  end

  # GET /users/1/edit
  # GET /users/1/edit.xml
  # GET /users/1/edit.json
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    #params[:user][:role_ids] ||= []
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { respond_to_destroy(:html) }
      format.xml { head :ok}
      format.json { respond_to_destroy(:ajax) }
    end
  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:json, :xml, :html)
  end

end
