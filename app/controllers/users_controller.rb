class UsersController < ApplicationController

  def login
    user = get_current_user
    
    if user
      render json: user.to_json(:include => {
        :user_countries => {:include => {:country => {:only => [:name, :code] }}, :only => [:id]},
        :wishlists => {:include => {:country => {:only => [:name, :code, :id] }}, :only => [:id]}
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
        :user_countries => {:include => {:country => {:only => [:name, :code] }}, :only => [:id]},
        :wishlists => {:include => {:country => {:only => [:name, :code, :id] }}, :only => [:id]}
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
        :user_countries => {:include => {:country => {:only => [:name, :code] }}, :only => [:id]},
        :wishlists => {:include => {:country => {:only => [:name, :code, :id] }}, :only => [:id]}
        })
    else
      user.countries.delete(country)
      render json: user.to_json(:include => {
        :user_countries => {:include => {:country => {:only => [:name, :code] }}, :only => [:id]},
        :wishlists => {:include => {:country => {:only => [:name, :code, :id] }}, :only => [:id]}
        })
    end
  end

  def add_to_wishlist
    user = User.find(params[:userId])
    country = Country.find(params[:countryId])
    wishlist = Wishlist.find_by(user_id: user.id, country_id: country.id)
    if wishlist
      wishlist.destroy
      render json: user.to_json(:include => {
        :user_countries => {:include => {:country => {:only => [:name, :code] }}, :only => [:id]},
        :wishlists => {:include => {:country => {:only => [:name, :code, :id] }}, :only => [:id]}
        })
    else
      Wishlist.create(user_id: user.id, country_id: country.id)
      render json: user.to_json(:include => {
        :user_countries => {:include => {:country => {:only => [:name, :code] }}, :only => [:id]},
        :wishlists => {:include => {:country => {:only => [:name, :code, :id] }}, :only => [:id]}
        })
    end
  end

  def update
    user = User.find(params[:id])
    user.age = (params[:age])
    user.save

    render json: user.to_json
  end

  def delete
  end
end
