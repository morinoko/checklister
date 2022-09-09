class Todo < ApplicationRecord
  validates :summary, presence: true

  scope :ordered, -> { order(created_at: :desc) }

  # after_create_commit -> { broadcast_prepend_later_to "todos" }
  # after_update_commit -> { broadcast_replace_later_to "todos" }
  # after_destroy_commit -> { broadcast_remove_to "todos" }
  broadcasts_to ->(todo) { "todos" }, inserts_by: :prepend
end
