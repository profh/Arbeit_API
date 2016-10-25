module V2 
  class ApplicationController < ActionController::API
    include ActionController::Serialization
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    include ActionController::HttpAuthentication::Token::ControllerMethods

    # A method to handle initial authentication
    def token
      authenticate_with_http_basic do |email, password|
        user = User.authenticate(email, password)
        if user
          render json: { token: user.auth_token }
        else
          render json: { error: 'Incorrect credentials' }, status: 401
        end
      end
    end

    # We want every other interaction to be authenticated with the token
    before_filter :authenticate_user_from_token, except: [:token]

    def authenticate_user_from_token
      unless authenticate_with_http_token { |token, options| User.find_by(auth_token: token) }
        render json: { error: 'Bad Token'}, status: 401
      end
    end
  end
end
