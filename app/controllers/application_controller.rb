class ApplicationController < ActionController::API
    def authorize_request
        header = request.headers["Authorization"]
        token = header.split(" ").last rescue nil

        decoded = JsonWebToken.decode(token)
        @current_user = User.find(decoded[:user_id]) if decoded
    rescue
        render json: { error: "Not authorized" }, status: :unauthorized
    end
end
