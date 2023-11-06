class AddPageVisitorToTables < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :page_visitor, :integer, default: 0
    add_column :cities, :page_visitor, :integer, default: 0
    add_column :countries, :page_visitor, :integer, default: 0
  end
end
