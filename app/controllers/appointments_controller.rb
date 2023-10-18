class AppointmentsController < ApplicationController
  def index
  end

  def new
    @patient = Patient.find_by(id: params[:patient_id])
    @appointment=@patient.appointments.new
   end

  def create
    @patient = Patient.find_by(id: params[:patient_id])
    @appointment = @patient.appointments.create(appointment_params)
    @appointment.doctor_id = current_doctor.id


    if @appointment.save
      redirect_to doctor_patient_appointment_path(current_doctor,@patient,@appointment)

    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @doctor_id = params[:doctor_id]
    @patient = Patient.find_by(id: params[:patient_id])
    @appointment=@patient.appointments.find(params[:id])


  end

  private
  def appointment_params
    params.require(:appointment).permit(:id, :appointment_date, :doctor_id, :patient_id)
  end
end
