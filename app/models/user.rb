class User < ActiveRecord::Base
  validates :name, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_secure_password
  after_initialize :ensure_session_token

  has_many :user_views
  has_many :user_saves,
           class_name: 'UserSave',
           foreign_key: :user_id

  has_many :saved_tips, through: :user_saves, source: :tip
  has_many :viewed_tips, through: :user_views, source: :tip

  def reset_session_token
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  private

  def ensure_session_token
    self.session_token ||= generate_session_token
  end
end
