class AddLoginToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :login_id, :string
  end
end
