class ProgramsController < ApplicationController
  before_action :authenticate_admin!, only: [ :create, :update, :destroy ]

  # POST /programs - Create a program (Admin only)
  def create
    program = Program.new(program_params)
    if program.save
      render json: { program: program }, status: :created
    else
      render json: { error: program.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /programs/:id - Update a program (Admin only)
  def update
    program = Program.find(params[:id])
    if program.update(program_params)
      render json: { program: program }, status: :ok
    else
      render json: { error: program.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /programs/:id - Delete a program (Admin only)
  def destroy
    program = Program.find(params[:id])
    if program.destroy
      render json: { message: "Program deleted successfully" }, status: :ok
    else
      render json: { error: "Failed to delete program" }, status: :unprocessable_entity
    end
  end

  private

  def program_params
    params.require(:program).permit(:name, :start_date, :end_date, :organization_id)
  end
end
