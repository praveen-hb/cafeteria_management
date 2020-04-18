class RemoveSelectedFromMenuItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :menu_items, :selected, :boolean
  end
end
