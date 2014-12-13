class User < ActiveRecord::Base
  validates :name, :password, :session_token, presence: true

  has_secure_password

  has_many :user_views
  has_many :user_saves

  has_many :saved_tips, through: :user_saves, source: :tip_id
  has_many :viewed_tips, through: :user_views, source: :tip_id
end
