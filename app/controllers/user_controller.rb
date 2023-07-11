class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :update, :destroy]

  def all
    @users = User.all

    render json: @users
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)

    return render json: @user, status: :created if @user.save

    render json: @user.errors, status: :bad_request
  end

  def update
    return render json: @user if @user.update(user_params)

    render json: @user.errors, status: :bad_request
  end

  def destroy
    return render json: { message: "User deleted" } if @user.delete

    render json: @user.errors, status: :bad_request
  end

  private

  def set_user
    begin
      @user = User.find(params[:hash_id])
    rescue => exception
      render json: { error: "User doesn't exists" }
    end
  end

  def user_params
    params.require(:user).permit(:email, :password_master, :cpf, :phone)
  end
end
