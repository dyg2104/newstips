class Tip < ActiveRecord::Base
  validates :text, presence: true

  has_many :user_views
end
