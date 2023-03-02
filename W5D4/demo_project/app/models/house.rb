# == Schema Information
#
# Table name: houses
#
#  id         :bigint           not null, primary key
#  address    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class House < ApplicationRecord
  validates :address, presence: true

  has_many :residents,
    class_name: :Person,
    foreign_key: :houses_id,
    primary_key: :id
end
