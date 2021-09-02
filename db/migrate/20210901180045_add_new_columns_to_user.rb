class AddNewColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :username, null: false
      t.string :personal_web_site_url
      t.string :about_me_title
      t.text :about_me_description
    end
  end
end
