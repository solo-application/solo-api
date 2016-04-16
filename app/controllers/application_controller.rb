class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def current_user
    @user_session ||= Session.find_by_session_token(retrieve_session_token)

    return @user_session.user if @user_session
    nil
  end

  def validate_user
    return true if current_user
    render json: { status: "User doesn't have permissions for this request" }, status: :unauthorized
  end

  private

  def retrieve_session_token
    if request.headers['Authorization']
      return request.headers['Authorization'].split(' ').last
    end
    nil
  end
end
