class ChangeDataTypeForListingDescription < ActiveRecord::Migration
  def up
   change_column :listings, :description, :text
  end

  def down
   change_column :listings, :description, :string
  end
end
