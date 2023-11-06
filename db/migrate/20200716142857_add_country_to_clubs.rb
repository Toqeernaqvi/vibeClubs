class AddCountryToClubs < ActiveRecord::Migration[6.0]
  def change
    add_reference :clubs, :country, null: false, foreign_key: true
  end
end
