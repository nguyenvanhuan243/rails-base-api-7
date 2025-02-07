# == Schema Information
#
# Table name: todos
#
#  id         :bigint           not null, primary key
#  name       :string
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Todo < ApplicationRecord
  include Filterable
  validates :name, uniqueness: true, presence: true
  enum status: {
    active: 1,
    completed: 2
  }
  scope :status, lambda { |status|
                   where(status:)
                 }
end
