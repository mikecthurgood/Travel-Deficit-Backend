class ApplicationController < ActionController::Base
    protect_from_forgery unless: -> { request.format.json? }
    def get_current_user
        fb_id = facebookId
        User.find_by(fb_id: fb_id)
    end
    
    def facebookId
        request.headers['Authorization']
    end
end
