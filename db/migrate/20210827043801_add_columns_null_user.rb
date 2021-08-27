# Comment
class AddColumnsNullUser < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false
    change_column_null :users, :company, false
    change_column_null :users, :carrer, false
    change_column_null :users, :country, false
    change_column_null :users, :city, false
  end
end
