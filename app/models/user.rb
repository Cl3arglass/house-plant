class User < ApplicationRecord

	has_many :plants
    has_many :comments, through: :plants

    has_secure_password

    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
end
