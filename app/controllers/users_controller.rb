class UsersController < ApplicationController

  def login
    user = get_current_user
    
    if user
      render json: user.to_json(:include => {
        :countries => {:only => [:name] }, :badges => {:only => [:name, :description]}
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
        :countries => {:only => [:name] }, :badges => {:only => [:name, :description]}
      })

      else
        render json: {error: 'User not found'}, status: 401
    end
  end

  def add_country
    user = get_current_user
    country = Country.find(params[:id])
    if !user.countries.include(country)
      user.countries << country
  end

  def update
  end

  def delete
  end
end
