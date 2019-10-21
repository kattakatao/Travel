class AddNickNameToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :nickname, :string
  end
end
