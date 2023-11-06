class Club < ApplicationRecord
  belongs_to :user
  belongs_to :city
  belongs_to :country
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
  has_many :features, dependent: :destroy

  validates :name, :address, :photos, 
            :dress_code, presence: true

  enum status: [:inactive, :active]
  def average_rating
    total_points = 0
    average = 0
    self.reviews.each do |review|
      total_points += review.stars
      average = total_points.fdiv(reviews.count)
    end
    average.round(1)
  end

  def increase_page_visitor
     self.page_visitor+= 1
  end
end
