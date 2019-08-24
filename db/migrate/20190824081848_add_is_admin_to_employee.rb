class AddIsAdminToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :is_admin, :boolean
  end
end
