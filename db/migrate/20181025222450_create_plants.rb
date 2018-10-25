class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :user_id
      t.integer :category_id
      t.string :light
      t.string :watering

      t.timestamps
    end
  end
end
