class AddSelectionToMenuItems < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_items, :selected, :boolean
  end
end
