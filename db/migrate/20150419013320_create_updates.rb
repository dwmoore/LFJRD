class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.references :profile, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
