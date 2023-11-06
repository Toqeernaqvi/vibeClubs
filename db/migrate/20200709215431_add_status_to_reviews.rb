class AddStatusToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :confirmed, :boolean, default: false
  end
end
