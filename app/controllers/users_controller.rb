class UsersController < ApplicationController
  self.before_action :load_user, only: [:show, :destroy, :update, :edit]


  def new
  end

  def create    
    @user = User.create(user_params)
    logger.debug @user.inspect
    if @user.valid?
      redirect_to("/users/#{@user.id}")
    else
      render(:new)
      # error message??
    end

  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to("/")
  end

  def update
    @user.update(user_params)
    redirect_to("/users/#{@user.id}")
  end

  def edit
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    
    if params[:password].empty?
      return {
        first_name: params[:first_name],
        last_name: params[:last_name],
        dob: params[:dob],
        gender: params[:gender],
        email: params[:email],
        facebook_link: params[:facebook_link],
      }
    else
      return {
        first_name: params[:first_name],
        last_name: params[:last_name],
        dob: Date.parse(params[:dob]),
        gender: params[:gender],
        email: params[:email],
        facebook_link: params[:facebook_link],
        password: params[:password]
      }
    end
  end
end