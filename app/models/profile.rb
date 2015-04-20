class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :updates, dependent: :destroy

  URL_REGEX = /(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/\S*)?/i

  validates :first_name, :last_name, presence: true
  validates :why, :goals, :recently_learned, :gems, length: { maximum: 500 }

  validates :website, format: { with: URL_REGEX, message: "Error - Please enter valid URL."},
            unless: Proc.new { |profile| profile.website.blank? }
  validates :twitter, format: { with: URL_REGEX , message: "Error - Please enter valid URL."},
            unless: Proc.new { |profile| profile.twitter.blank? }
  validates :git_app, format: { with: URL_REGEX , message: "Error - Please enter valid URL."},
            unless: Proc.new { |profile| profile.git_app.blank? }
  validates :crud_project, format: { with: URL_REGEX , message: "Error - Please enter valid URL."},
            unless: Proc.new { |profile| profile.crud_project.blank? }
  validates :api_project, format: { with: URL_REGEX , message: "Error - Please enter valid URL."},
            unless: Proc.new { |profile| profile.api_project.blank? }
  validates :tested_project, format: { with: URL_REGEX , message: "Error - Please enter valid URL."},
            unless: Proc.new { |profile| profile.tested_project.blank? }


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
