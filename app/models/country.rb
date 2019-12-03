require 'unirest'
class Country < ApplicationRecord
    has_many :user_countries
    has_many :wishlists
    has_many :users, through: :user_countries

    def self.call_skyscanner(departureLocation, destination, departureDate, returnDate)
        response = Unirest.post "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/v1.0",
  headers:{
    "X-RapidAPI-Host" => "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
    "X-RapidAPI-Key" => "0d5efc74c5msh7dfd2aaa64fdf54p129ba0jsne3580f668b49",
    "Content-Type" => "application/json"
  },
  parameters:{
    "inboundDate" => returnDate,
    "cabinClass" => "economy",
    "children" => 0,
    "infants" => 0,
    "country" => "UK",
    "currency" => "GBP",
    "locale" => "en-US",
    "originPlace" => departureLocation,
    "destinationPlace" => destination,
    "outboundDate" => departureDate,
    "adults" => 1
  }
    end
end
