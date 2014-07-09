class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :user_id, null: false
      t.integer :listing_id, null: false
      t.string :title, null: false
      t.text :description
      t.integer :swap_listing_id
      t.string :status, default: "Open"

      t.timestamps
    end
  end
end
