class CreateRecentlyVisiteds < ActiveRecord::Migration
  def change
    create_table :recently_visiteds do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
