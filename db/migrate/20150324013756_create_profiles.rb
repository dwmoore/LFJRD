class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :website
      t.string :twitter
      t.string :github
      t.string :bitbucket
      t.string :crud_project
      t.string :api_project
      t.string :tested_project
      t.text :why
      t.text :goals
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
