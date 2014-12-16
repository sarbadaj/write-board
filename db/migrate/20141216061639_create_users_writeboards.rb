class CreateUsersWriteboards < ActiveRecord::Migration
  def change
    create_table :users_writeboards do |t|
      t.string :title
      t.string :body
      t.references :user, index: true
      t.references :writeboard, index: true
    end
  end
end
