class AddColumnToListings < ActiveRecord::Migration
  def change
    change_table :listings do |t|
      t.string :status, default: "Open"
    end
  end
end
