class AddColumToUsersIsadmin < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, null: false, after: :id
    add_column :users, :isadmin, :boolean, default: false, null: false, after: :name
  end
end
