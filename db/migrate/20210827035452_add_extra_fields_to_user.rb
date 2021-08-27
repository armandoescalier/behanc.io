# Comment
class AddExtraFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :carrer, null: false
      t.string :company, null: false
      t.string :country, null: false
      t.string :city, null: false
    end
  end
end
