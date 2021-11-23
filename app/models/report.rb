class Report < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
