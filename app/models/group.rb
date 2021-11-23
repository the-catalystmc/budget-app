class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many_groups :reports

  validates :name, presence: true
end
