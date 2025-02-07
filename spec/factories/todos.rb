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
FactoryBot.define do
  factory :todo do
    name { "MyString" }
    status { 1 }
  end
end
