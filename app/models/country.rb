require 'unirest'
class Country < ApplicationRecord
    has_many :user_countries
    has_many :wishlists
    has_many :users, through: :user_countries

    def self.call_skyscanner(departureLocation, destination, departureDate, returnDate)
        response = Unirest.post "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/v1.0",
  headers:{
    "x-rapidapi-host": "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
    "x-rapidapi-key": "571c034a1amshba07a35df5f1f2bp163af5jsn9566c59b5b86",
    "Content-Type" => "application/x-www-form-urlencoded"
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
