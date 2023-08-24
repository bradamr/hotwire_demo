class Comment < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  scope :by_descending, -> { order('created_at DESC') }

  has_many :likes, dependent: :destroy

  after_create_commit -> { broadcast_prepend_to "comments", partial: "comments/comment", locals: { comment: self }, target: "comments" }
end