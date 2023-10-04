class PatientsController < ApplicationController
  before_action :find_patient, only: [:edit, :update, :destroy, :show]

  def index
    if !params[:query].blank?
      @patients = current_doctor.patients.where("name LIKE ?", "%#{params[:query]}%")
    else
      @patients = current_doctor.patients
    end
  end

  def new
    @patient = current_doctor.patients.new
  end

  def create
    # before action find_doctor
    @patient = current_doctor.patients.new(patient_params)
    if @patient.save
      redirect_to doctor_patient_path(doctor_id: current_doctor.id, id: @patient.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # before action find_doctor
  end

  def update
    # before action find_doctor
    if @patient.update(patient_params)
      redirect_to doctor_patient_path(current_doctor, @patient)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    # before action find_doctor
  end

  def destroy
    # before action find_doctor
    @patient.destroy
    redirect_to doctor_patients_path, status: :see_other
  end

  def find_patient
    @patient = current_doctor.patients.find(params[:id])
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :email, :age)
  end

end
