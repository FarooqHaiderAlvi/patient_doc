class PatientsController < ApplicationController
  before_action :find_patient, only: [:edit, :update, :destroy, :show]

  def index
    if !params[:query].blank?
      @patients = Patient.where("name LIKE ?", "%#{params[:query]}%")
    else
      @patients = Patient.all
    end
  end

  def new
    @patient = current_doctor.patients.new
  end

  def create
    @patient = current_doctor.patients.new(patient_params)
    @patient.doctor_id=current_doctor.id
    if @patient.save
      redirect_to doctor_patient_path(doctor_id: current_doctor.id, id: @patient.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # before_action find_patient
  end

  def update
    # before_action find_patient
    if @patient.update(patient_params)
      redirect_to doctor_patient_path(current_doctor, @patient)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    # before action find_patient
  end

  def destroy
    # before action find_patient
    @patient.destroy
    redirect_to doctor_patients_path, status: :see_other
  end

  def doctors_patients
    @patients = current_doctor.patients.distinct
  end

  private

  def find_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :email, :age)
  end

end
