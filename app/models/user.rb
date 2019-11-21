class User < ApplicationRecord
    has_many :user_countries
    has_many :user_badges
    has_many :countries, through: :user_countries
    has_many :badges, through: :user_badges
end
