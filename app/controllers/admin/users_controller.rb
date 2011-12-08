module Admin
  
class UsersController < Admin::ApplicationController
  
  def index
    @users = User.paginate(:page => params[:page], :per_page => 15)
  end
  
  def create
    @user = User.new(params[:user])
    @user.save ? redirect_to(admin_users_path) : render(:action => :new)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_users_path
  end
  
  def update
    @user = User.find(params[:id])    
    @user.update_attributes(params[:user]) ? redirect_to(admin_users_path) : render(:action => :edit)
  end

  
end

end
