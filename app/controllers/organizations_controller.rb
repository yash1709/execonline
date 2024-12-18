class OrganizationsController < ApplicationController
  # before_action :authenticate_super_admin!, only: [ :create, :update, :destroy ]

  # POST /organizations - Create an organization (Super Admin only)
  def create
    organization = Organization.new(organization_params)
    if organization.save
      render json: { organization: organization }, status: :created
    else
      render json: { error: organization.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organizations/:id - Update an organization (Super Admin only)
  def update
    organization = Organization.find(params[:id])
    if organization.update(organization_params)
      render json: { organization: organization }, status: :ok
    else
      render json: { error: organization.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /organizations/:id - Delete an organization (Super Admin only)
  def destroy
    organization = Organization.find(params[:id])
    if organization.destroy
      render json: { message: "Organization deleted successfully" }, status: :ok
    else
      render json: { error: "Failed to delete organization" }, status: :unprocessable_entity
    end
  end

  private
  def organization_params
    params.require(:organization).permit(:name)
  end
end
