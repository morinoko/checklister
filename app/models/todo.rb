class Todo < ApplicationRecord
  validates :summary, presence: true

  scope :ordered, -> { order(created_at: :desc) }
end
