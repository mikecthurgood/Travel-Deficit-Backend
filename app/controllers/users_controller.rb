class UsersController < ApplicationController

  def login
    user = get_current_user
    
    if user
      render json: user.to_json(:include => {
        :countries => {:only => [:name, :code] }, :badges => {:only => [:name, :description]}
      })

      else
        user = User.create(name: params[:name], image_url: params[:image_url], fb_id: params[:fb_id])
        if user.save
        render json: user.to_json()
        else
          render json: {error: 'Unable to create user'}, status: 405
        end
      end
  end

  def validate
    user = get_current_user

    if user
      render json: user.to_json(:include => {
        :countries => {:only => [:name, :code] }, :badges => {:only => [:name, :description]}
      })

      else
        render json: {error: 'User not found'}, status: 401
    end
  end

  def add_user_country
    user = User.find(params[:userId])
    country = Country.find(params[:countryId])
    if !user.countries.include?(country)
      user.countries << country
      render json: user.to_json(:include => {
        :countries => {:only => [:name] }, :badges => {:only => [:name, :description]}
      })
    else
      user.countries.delete(country)
      render json: user.to_json(:include => {
        :countries => {:only => [:name] }, :badges => {:only => [:name, :description]}
      })
    end
  end

  def update
  end

  def delete
  end
end
