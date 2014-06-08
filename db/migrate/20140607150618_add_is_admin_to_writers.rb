class AddIsAdminToWriters < ActiveRecord::Migration
  def change
    add_column :writers, :is_admin, :boolean
  end
end
