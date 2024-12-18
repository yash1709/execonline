class SessionsController < ApplicationController
    # POST /login - User login
    def create
      user = User.find_by(email: params[:email])

      if user&.valid_password?(params[:password])  # Devise method to authenticate password
        sign_in(user)  # Devise method to sign in the user
        render json: { message: "Logged in successfully", user: user }, status: :ok
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end

    # DELETE /logout - User logout
    def destroy
      sign_out(current_user)  # Devise method to sign out the user
      render json: { message: "Logged out successfully" }, status: :ok
    end
end
