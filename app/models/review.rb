class Review < ApplicationRecord
  belongs_to :club
  after_create :send_confirmation
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  private

  def send_confirmation
    ReviewMailer.confirm(self).deliver_now
  end
end
