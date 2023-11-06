class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :email
      t.integer :stars
      t.text :content
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
