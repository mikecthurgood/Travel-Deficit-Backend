class Country < ApplicationRecord
    has_many :user_countries
    has_many :wishlists
    has_many :users, through: :user_countries
end
