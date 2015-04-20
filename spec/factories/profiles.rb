FactoryGirl.define do
  factory :profile do
    first_name "Mike"
    last_name "Mulligan"
    website "http://website.com"
    twitter "http://twitter.com/profile"
    git_app "http://github.com/profile"
    crud_project "http://github.com/profile"
    api_project "http://bitbucket.com/profile"
    tested_project "http://bitbucket.com/profile"
    why "MyText"
    goals "MyText"
    gems "MyText"
    recent_learning "MyText"
    featured false
    user
  end

end
