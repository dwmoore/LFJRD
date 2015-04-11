class ChangeGitReposOnProfile < ActiveRecord::Migration
  def up
    rename_column :profiles, :github, :git_app
    remove_column :profiles, :bitbucket
  end

  def down
    rename_column :profiles, :git_app, :github
    add_column :profiles, :bitbucket, :string
  end
end
