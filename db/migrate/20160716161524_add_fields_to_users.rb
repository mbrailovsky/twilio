class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :integer
    add_column :users, :cc_number, :string
    add_column :users, :cc_exp_date, :string
    add_column :users, :cvv, :integer
  end
end
