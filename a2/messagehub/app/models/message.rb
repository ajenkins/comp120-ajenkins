class Message < ActiveRecord::Base
  validates :app_id, presence: true
  validates :content, presence: true, length: {maximum: 160}
  validates :username, presence: true, length: {in: 3..60}
  validates :active, presence: true
  
  belongs_to :app
end
