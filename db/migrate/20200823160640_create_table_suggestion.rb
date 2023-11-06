class CreateTableSuggestion < ActiveRecord::Migration[6.0]
  def change
    create_table :suggestions do |t|
    	t.string :country
    	t.string :city
    	t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
