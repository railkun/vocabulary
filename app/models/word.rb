class Word < ActiveRecord::Base
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  belongs_to :user

  validates :title, presence: true
  validates :translation, presence: true
  validates :title, uniqueness: {scope: :user}
  paginates_per 10
end
