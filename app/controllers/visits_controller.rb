class VisitsController < ApplicationController
  before_action :find_appointment, only: [:new, :create]
  before_action :find_visit, only: [:new]

  def new
    # before_action: find appointment
    # before_action: find visit
    if !@visit
      @visit = @appointment.build_visit
    else
      redirect_to appointment_visit_path(@appointment,@visit)
    end
  end

  def create
    # before_action: find appointment
    @visit = @appointment.build_visit(visit_params)
    if @visit.valid? && @visit.save
      redirect_to appointment_visit_path(@appointment,@visit)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def visit_params
    params.require(:visit).permit(:has_visited)
  end

  def find_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def find_visit
    @visit = Visit.find_by(appointment_id: params[:appointment_id])
  end

end