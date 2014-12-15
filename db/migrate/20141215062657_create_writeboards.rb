class CreateWriteboards < ActiveRecord::Migration
  def change
    create_table :writeboards do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
