class Link < ActiveRecord::Base
  belongs_to :traveller, class_name: 'User', inverse_of: :traveller_links
  belongs_to :companion, class_name: 'User', inverse_of: :companion_links
end
