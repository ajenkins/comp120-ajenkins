class App < ActiveRecord::Base
  validates :app_title, presence: true
  validates :description, presence: true
  validates :active, presence: true
  
  has_many :messages
end
