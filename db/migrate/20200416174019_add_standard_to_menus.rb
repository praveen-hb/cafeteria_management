class AddStandardToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :Standard, :boolean
  end
end
