class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :category
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
