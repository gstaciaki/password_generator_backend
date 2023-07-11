class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show]

  def all
    @users = User.all
    render json: @users
  end

  def show
  end

  def new
    @user = User.new(user_params)

    return render json: { error: 'Email already exists' }, status: :unprocessable_entity if User.exists?(email: @user.email)

    return render json: @user, status: :created if @user.save

    render json: @user.errors, status: :unprocessable_entity
  end

  private

  def set_user
    @user = User.find(params[:hash_id])
  end

  def user_params
    params.require(:user).permit(:email, :password_master, :cpf, :phone)
  end
end
