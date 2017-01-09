class User < ApplicationRecord
	has_many :orders

	validates :email, presence: true
	validates :email, uniqueness: true
	validates :password_confirmation, presence: true
	validates :password, presence: true, confirmation: true, length: { in: 8..32}
    validates :username, length: {in: 0..32}
end
