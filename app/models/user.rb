class User < ActiveRecord::Base
  has_secure_password

  has_many :traveller_links, class_name: 'Link', inverse_of: :traveller, foreign_key: 'traveller_id'
  has_many :companion_links, class_name: 'Link', inverse_of: :companion, foreign_key: 'companion_id'
  has_many :trips
end
