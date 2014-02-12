class UsersController < ApplicationController
  before_action :load_user, only: [:show, :destroy, :update, :edit]


  def new
    @user=User.new
  end

  def create    
    @user = User.create(user_params)
    logger.debug @user.inspect
    if @user.valid?
      redirect_to user_path(@user)
    else
      render(:new)
      # error message??
    end

  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def update
    @update_worked = @user.update(user_params)
    if @update_worked
      redirect_to user_path(@user)
    else
      render(:edit)
      # error message??
    end
  end

  def edit
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params

    if params[:user][:password].empty?
      params[:user][:password] = @user.password
      params.require(:user).permit(:first_name, :last_name, :dob, :gender, :email, :facebook_link, :password)
    else
      params.require(:user).permit(:first_name, :last_name, :dob, :gender, :email, :facebook_link, :password)
    end
  end
end