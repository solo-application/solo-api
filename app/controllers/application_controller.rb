class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def current_user
    @user ||= User.find_by_id(params[:user_id])

    return @user if @user
    nil
  end

  def validate_user
    return true if current_user
    render json: { status: "User doesn't have permissions for this request" }, status: :unauthorized
  end
end
