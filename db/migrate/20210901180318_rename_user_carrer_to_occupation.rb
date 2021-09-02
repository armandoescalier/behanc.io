class RenameUserCarrerToOccupation < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :carrer, :occupation
  end
end
