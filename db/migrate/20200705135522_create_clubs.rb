class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :address
      t.string :for_who
      t.boolean :table_service, default: true
      t.string :dress_code
      t.string :phone
      t.string :website
      t.string :instagram
      t.string :facebook

      t.timestamps
    end
  end
end
