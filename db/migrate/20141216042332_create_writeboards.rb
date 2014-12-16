class CreateWriteboards < ActiveRecord::Migration
  def change
    create_table :writeboards do |t|
      t.string :title
      t.string :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
