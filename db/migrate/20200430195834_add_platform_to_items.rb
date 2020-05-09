class AddPlatformToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :platform, :text
  end
end
