class AddAtributesToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :recently_learned, :text
    add_column :profiles, :gems, :text
  end
end
