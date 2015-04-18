class Profile < ActiveRecord::Base
  belongs_to :user

  URL_REGEX = /\b((?:https?:\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/?)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s\`!()\[\]{};:\'\".,<>?«»“”‘’]))/i

  validates :first_name, :last_name, presence: true
  validates :why, :goals, length: { maximum: 250 }

  validates :website, format: { with: URL_REGEX, message: "Please enter valid URL."},
            unless: Proc.new { |profile| profile.website.blank? }
  validates :twitter, format: { with: URL_REGEX , message: "Please enter valid URL."},
            unless: Proc.new { |profile| profile.twitter.blank? }


  def get_email
    self.user.email
  end

  def full_name
    self.first_name + " " + self.last_name
  end

  def repo_service
    git_app = self.git_app
    if git_app.include? "github"
      "github"
    elsif git_app.include? "bitbucket"
      "bitbucket"
    else
      "code"
    end
  end
end
