class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  # POST /enrollments - Enroll a student or coach in a program
  def create
    program = Program.find(params[:program_id])
    user = current_user

    # Ensure the user is from the same organization as the program
    if user.organization_id == program.organization_id
      enrollment = Enrollment.new(user: user, program: program)
      if enrollment.save
        render json: { message: "Enrolled in program successfully", enrollment: enrollment }, status: :created
      else
        render json: { error: enrollment.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Cannot enroll in a program from another organization" }, status: :unprocessable_entity
    end
  end

  # GET /enrollments - List the programs the user is enrolled in
  def index
    user = current_user
    enrollments = user.enrollments.includes(:program)
    render json: enrollments.map { |enrollment| enrollment.program }, status: :ok
  end
end
