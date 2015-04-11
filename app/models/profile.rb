class Profile < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :last_name, presence: true

  def get_email
    self.user.email
  end
end
