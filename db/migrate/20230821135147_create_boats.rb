class CreateBoats < ActiveRecord::Migration[7.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :guests
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
