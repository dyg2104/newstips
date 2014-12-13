class Tip < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_subject_and_text, against: [:subject, :text]

  validates :text, presence: true

  has_many :user_views
end
