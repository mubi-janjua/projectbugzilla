class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :user_type, presence: true
  enum user_type: [:manager, :developer, :qa]

	has_many :projectusers, dependent: :destroy
	has_many :projectts, through: :projectusers
  has_many :bugs

end
