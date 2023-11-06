class AddOpeningHoursToClubs < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :day, :text, array: true, default: []
    add_column :clubs, :open_from, :integer
    add_column :clubs, :closes_at, :integer
  end
end
