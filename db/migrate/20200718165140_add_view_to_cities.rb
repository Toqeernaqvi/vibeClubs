class AddViewToCities < ActiveRecord::Migration[6.0]
  def change
    add_column :cities, :view, :integer, default: 0
  end
end
