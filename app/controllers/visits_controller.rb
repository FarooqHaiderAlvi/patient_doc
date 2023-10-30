class VisitsController < ApplicationController
  before_action :find_appointment, only: [:new, :create, :show]
  before_action :find_visit, only: [:new, :show]
  before_action :find_prescription, only: [:show]
  def new
    # before_action: find appointment
    # before_action: find visit
    unless @visit
      @visit = @appointment.build_visit
    else
      redirect_to appointment_visit_path(@appointment, @visit)
    end

  end

  def create
    # before_action: find appointment
    @visit = @appointment.build_visit(visit_params)
    if @visit.valid? && @visit.save
      redirect_to appointment_visit_path(@appointment, @visit)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # before action find prescription
    if @prescription
    @medicines = Medicine.where(prescription_id: @prescription.id)
    @medicine = @prescription.medicines.new
    end
  end

  private

  def visit_params
    params.require(:visit).permit(:has_visited)
  end

  def find_prescription
    @prescription = Prescription.find_by(visit_id: @visit.id)
  end

  def find_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def find_visit
    @visit = Visit.find_by(appointment_id: params[:appointment_id])
  end

end