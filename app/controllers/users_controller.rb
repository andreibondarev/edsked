class UsersController < ApplicationController
  before_filter :authenticate_user!

  # def new
  #   @user = User.new
  # end

  def index
    @users = User.where(role: User.roles[params[:role]])
  end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     flash[:success] = "User saved successfully."
  #     @users = User.all
  #     render 'index'
  #   else
  #     render 'new'
  #   end
  # end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes(period_params)
  #     flash[:success] = "User saved successfully."
  #     @users = User.all
  #     render 'index'
  #   else
  #     render 'edit'
  #   end

  # end

  # def show
  #   @user = User.find(params[:id])
  # end

  private

  def user_params
    params.require(:user)
      .permit(:first_name, :last_name, :email, :role_id)
  end
end
