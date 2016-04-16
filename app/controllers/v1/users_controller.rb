module V1
  class UsersController < ApplicationController
    before_action only: [:index, :show, :update] do
      validate_user
    end

    def create
      @user = User.new(user_params)
      if @user.save
        @session = @user.sessions.create
        render 'v1/users/create', status: :created
      else
        render json: @user.errors, status: :bad_request
      end
    end

    def show
      @user = User.find_by_id(params[:user_id])
      if @user
        render 'users/show', status: :ok
      else
        render json: { status: 'User not found' }, status: :not_found
      end
    end

    def current_user
      @user = User.find_by_id(params[:user_id])
      if @user
        @session = @user.sessions.create
        render 'users/show', status: :ok
      else
        render json: { status: 'User not found' }, status: :not_found
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end
