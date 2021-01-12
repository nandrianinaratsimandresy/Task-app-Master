class Task < ApplicationRecord
  default_scope { order(created_at: :desc)}
  validates :name, presence: true, uniqueness: true, length: { minimum: 3,maximum:12}
  validates :Details, presence: true, length: { minimum: 3, maximum: 20}
end
