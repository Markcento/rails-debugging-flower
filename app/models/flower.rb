class Flower < ApplicationRecord
  belongs_to :family

  validates :name, presence: true, allow_blank: false
  validates :family, presence: true
  validates :color, presence: true, allow_blank: false
end
