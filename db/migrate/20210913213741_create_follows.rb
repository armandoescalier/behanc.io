class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.belongs_to :follower
      t.belongs_to :followed_user

      t.timestamps
    end
  end
end
