class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
     session[:user_id] = @user.id
     redirect_to user_path(@user) 
    else
      render 'users/new'
    end
  end

  def edit
  end

  def update
  end

  def show
    if !session.include?(:user_id)
      redirect_to '/'
    else
      @user = User.find(params[:id])

      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
