class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :reports

  def total_expenses
    total = 0
    reports.each { |r| total += r.amount }
    total
  end 

  validates :name, presence: true
end
