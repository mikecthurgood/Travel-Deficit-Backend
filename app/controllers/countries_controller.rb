class CountriesController < ApplicationController
  
  def index
    countries = Country.all
      render json: countries.to_json(:only => [:name])
  end

  def info
    countries = Country.all
      render json: countries.to_json(:only => [:id, :name, :description, :continent, :population, :climate, :terrain, :code])
  end

  def create
    country = Country.all.find_by(name: params[:name])
    if !country
      Country.create(
        name: params[:name],
        description: params[:description],
        continent: params[:continent],
        population: params[:population],
        climate: params[:climate],
        terrain: params[:terrain],
      )
    end
  end

  def recommendations
    recommendation = Country.call_skyscanner(params[:departureLocation], params[:destination], params[:departureDate], params[:returnDate])
    byebug
    render json: recommendation
  end

  # def update
  #   country = Country.find(params[:id])
  #   country.code = params[:code]
  #   country.save
  # end
  
end
