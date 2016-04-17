module V1
  class UsersController < ApplicationController
    before_action only: [:index, :show, :update] do
      validate_user
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render 'v1/users/create', status: :created
      else
        render json: @user.errors, status: :bad_request
      end
    end

    def search
      @user         = User.find_by_id(params[:user_id])
      ignored_users = @user.companion_links.pluck(:companion_id) + [@user.id]
      @users        = User.where('username ILIKE ?', "%#{params[:keyword]}%").where.not(id: ignored_users)
      if @users
        render 'v1/users/index', status: :created
      else
        render json: { status: 'Users not found' }, status: :not_found
      end
    end

    def show
      @user = User.find_by_id(params[:user_id])
      if @user
        render 'v1/users/show', status: :ok
      else
        render json: { status: 'User not found' }, status: :not_found
      end
    end

    def current_user
      @user = User.find_by_username(params['username'])
      if @user && @user.authenticate(params['password'])
        render 'v1/users/create', status: :ok
      else
        render json: { status: 'User not found' }, status: :not_found
      end
    end

    def update
      @user = User.find_by_username(params['id'])
      if @user.update(user_params)
        render 'v1/users/create', status: :ok
      else
        render json: { status: 'User not found' }, status: :not_found
      end
    end

    private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
  end
end
