class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :description
      t.integer :value
      t.string :image
      t.integer :listing_category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
