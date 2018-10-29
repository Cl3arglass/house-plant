class User < ApplicationRecord

	has_many :plants
    has_many :categories, through: :plants
end
