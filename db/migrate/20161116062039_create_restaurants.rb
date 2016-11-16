class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name, :null => false
      t.string :city, :null => false
      t.string :state, :null => false

      t.timestamps
    end
  end
end
