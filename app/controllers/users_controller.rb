class UsersController < ApplicationController

  def index
    @users= User.all #.where(@todo.user_id == @user.username)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
  end
  
  def show
    @users= Todo.all #.where(@todo.user_id == @user.username)
  end
  
  def update
    @user= User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@user) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@user) }
      end
    end 
  end
  
  def destroy
    @user = Users.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html {redirect_to users_url}
      format.json {head :no_content}
    end
  end 
  

end
