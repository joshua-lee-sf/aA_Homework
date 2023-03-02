# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  houses_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Person < ApplicationRecord
  validates :name, presence: true

  belongs_to :house,
    class_name: :House,
    foreign_key: :houses_id,
    primary_key: :id
end
