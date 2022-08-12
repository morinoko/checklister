class Todo < ApplicationRecord
  validates :summary, presence: true
end
