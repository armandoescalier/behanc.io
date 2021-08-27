class AddExtraFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :carrer, :string
    add_column :users, :company, :string
    add_column :users, :country, :string
    add_column :users, :city, :string
  end
end
