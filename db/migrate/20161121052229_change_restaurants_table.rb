class ChangeRestaurantsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :webpage, :string
  end
end
