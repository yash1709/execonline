class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [ :create, :destroy ]

  # POST /users - Create a student or coach (Admin only)
  def create
    user = User.new(user_params)
    if user.save
      render json: { user: user }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id - Delete a student or coach (Admin only)
  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: { message: "User deleted successfully" }, status: :ok
    else
      render json: { error: "Failed to delete user" }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :role, :organization_id)
  end
end
