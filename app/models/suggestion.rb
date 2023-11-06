class Suggestion < ApplicationRecord
  
	belongs_to :user
  validates :city, :country , presence: true
end
