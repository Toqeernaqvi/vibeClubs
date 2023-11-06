class AddStatusColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :status, :integer, default: 1
    add_column :cities, :status, :integer, default: 1
    add_column :countries, :status, :integer, default: 1
  end
end
