class Bug < ApplicationRecord
  validates :title, presence: true
  validates :typed, presence: true
  validates :status, presence: true
  belongs_to :projectt
  has_one_attached :image
  belongs_to :creator, class_name: "User"
  belongs_to :developer, class_name: "User" ,optional: true
end
