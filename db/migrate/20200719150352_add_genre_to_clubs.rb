class AddGenreToClubs < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :genre, :string
  end
end
