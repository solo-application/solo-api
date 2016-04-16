module V1
  class SessionsController < ApplicationController
    def create
      @user = User.find_by_email(params[:user][:email])
      if @user && @user.authenticate(params[:password])
        @session = @user.sessions.new
        if @session.save
          render 'v1/sessions/create', status: :created
        else
          render @session.errors, status: :bad_request
        end
      else
        render json: { status: 'Wrong email and/or password' }
      end
    end

    def destroy
      @session = Session.find_by_session_token(params[:session_token])

      if @session
        if @session.destroy
          render json: { status: 'success' }, status: :ok
        else
          render json: @session.errors, status: :bad_request
        end
      else
        render json: { status: 'Cannot find session' }, status: :not_found
      end
    end
  end
end
