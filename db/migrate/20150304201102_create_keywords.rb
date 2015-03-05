class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :title
      t.integer :mechanic_id, null: false

      t.timestamps null: false
    end
  end
end
