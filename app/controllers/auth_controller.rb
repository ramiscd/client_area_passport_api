class AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)

      LogginLoggerJob.perform_later(user.id)
      
      render json: { token: token, user_id: user.id }
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end
