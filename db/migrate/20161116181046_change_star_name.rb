class ChangeStarName < ActiveRecord::Migration[5.0]
  def change
    rename_column :ratings, :star, :stars
  end
end
