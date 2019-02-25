class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :parking_space, dependent: :destroy
    has_many :booking, dependent: :destroy
    validates :username, :email, presence: true
end
