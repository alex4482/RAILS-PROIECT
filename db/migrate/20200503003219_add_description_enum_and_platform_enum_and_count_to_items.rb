class AddDescriptionEnumAndPlatformEnumAndCountToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :description_enum, :integer
    add_column :items, :platform_enum, :integer
    add_column :items, :count, :integer, default: 0
  end
end
