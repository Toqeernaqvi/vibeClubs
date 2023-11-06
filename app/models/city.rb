class City < ApplicationRecord
  belongs_to :country
  has_many :clubs, dependent: :destroy
  
  validates :name, :image, presence: true

  enum status: [:inactive, :active]
end
