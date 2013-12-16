class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @current_user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC").first(20)

  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else 
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
