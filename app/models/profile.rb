class Profile < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :last_name, presence: true

  def get_email
    self.user.email
  end

  def full_name
    self.first_name + " " + self.last_name
  end
end
