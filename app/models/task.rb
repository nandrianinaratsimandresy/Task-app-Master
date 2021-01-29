class Task < ApplicationRecord
  default_scope { order(created_at: :desc)}
  belongs_to :user, optional: true
  validates :name, presence: true, uniqueness: true, length: { maximum:50}
  validates :Details, presence: true, length: { maximum: 21}


end
