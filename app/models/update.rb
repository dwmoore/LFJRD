class Update < ActiveRecord::Base
  belongs_to :profile

  validates :body, presence: true
  validates :body, length: {maximum: 250}
end
