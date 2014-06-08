class AddDetailsToWriters < ActiveRecord::Migration
  def change

    add_column :writers, :first_name, :string
    add_column :writers, :last_name, :string
    add_column :writers, :screen_name, :string
    add_column :writers, :sex, :string
end
end
