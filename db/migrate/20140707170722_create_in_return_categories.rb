class CreateInReturnCategories < ActiveRecord::Migration
  def change
    create_table :in_return_categories do |t|
      t.integer :listing_id, null: false
      t.integer :category_id, null:false

      t.timestamps
    end
  end
end
