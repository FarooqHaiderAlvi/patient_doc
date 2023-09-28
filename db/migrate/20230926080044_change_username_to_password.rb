class ChangeUsernameToPassword < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :username, :email
    change_column :users, :email, :string
  end
end
