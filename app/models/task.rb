class Task < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  default_scope { order(created_at: :desc)}
  belongs_to :user, optional: true
  validates :name, presence: true, uniqueness: true, length: { maximum:50}
  validates :Details, presence: true, length: { maximum: 21}

  # accepts_nested_attributes_for :labels,
  # :reject_if => proc { |a| a['label_id'].blank? }
  # accepts_nested_attributes_for :labels
  # before_save do
  #   self.label.gsub! (/[\[\]\"]/,"") if attribute_present? ("label")
  # end

end
