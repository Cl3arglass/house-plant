class User < ApplicationRecord

	has_many :plants
    has_many :comments, through: :plants

    has_secure_password

    validates :email, presence: true
    validates :email, uniqueness: true
end
