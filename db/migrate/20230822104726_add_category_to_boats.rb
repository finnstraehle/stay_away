class AddCategoryToBoats < ActiveRecord::Migration[7.0]
  def change
    add_column :boats, :category, :string
  end
end
