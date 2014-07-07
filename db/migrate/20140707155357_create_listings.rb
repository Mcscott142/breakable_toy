class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :value, null: false
      t.string :image
      t.integer :category_id, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
