class AppointmentsController < ApplicationController
  before_action :find_patient, only: [:new, :create, :show]

  def index
  end

  def new
    # before_action: find patient
    @appointment=@patient.appointments.new
   end

  def create
    # before_action: find patient
    @appointment = @patient.appointments.create(appointment_params)
    @appointment.doctor_id = current_doctor.id
    if @appointment.save
      redirect_to doctor_patient_appointment_path(current_doctor,@patient,@appointment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # before_action: find patient
    @appointment=@patient.appointments.find(params[:id])
  end

  private

  def find_patient
    @patient = Patient.find(params[:patient_id])
  end

  def appointment_params
    params.require(:appointment).permit(:id, :appointment_date, :doctor_id, :patient_id)
  end
end
