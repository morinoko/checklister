class ShareGroup < ApplicationRecord
  validates :name, presence: true

  has_many :todos, dependent: :destroy
  has_many :users
end
