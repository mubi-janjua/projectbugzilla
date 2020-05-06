class Projectuser < ApplicationRecord
  belongs_to :user
  belongs_to :projectt
  validates :user_id, uniqueness: { scope: :projectt_id }
end
