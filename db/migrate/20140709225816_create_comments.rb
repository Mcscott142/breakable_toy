class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :offer_id, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
