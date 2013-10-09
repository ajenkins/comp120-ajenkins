class Message < ActiveRecord::Base
  validates :app_id, presence: true
  validates :content, presence: true
  validates :username, presence: true
  validates :active, presence: true
  
  belongs_to :app
end
