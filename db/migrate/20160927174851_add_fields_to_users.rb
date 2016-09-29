class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
    add_column :users, :email, :string
    add_column :users, :password, :string
  end
end
