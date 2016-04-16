class Session < ActiveRecord::Base
  belongs_to :user

  before_create :create_session_token

  private

  def create_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end
end
