class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :mechanic_id, null: false

      t.timestamps null: false
    end
  end
end
