class PatientsController < ApplicationController
  before_action :find_patient, only: [:edit, :update, :destroy, :show]

  def index
    if !params[:query].blank?
      @patients = Patient.where("name LIKE ?", "%#{params[:query]}%")
    else
      # @patients = Patient.where(doctor_id: current_doctor.id).select(:id, :name, :email, :age)
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
    # before_action method
  end

  def update
    # before_action method
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

  def doctors_patients
    @patients=@patients = current_doctor.patients

  end

  def find_patient
    # @patient = current_doctor.patients.find_by(id: params[:patient_id])
    # @patient = current_doctor.patients.where(doctor_id: current_doctor.id).select(:id, :name, :email, :age).find(params[:patient_id])
    # @patient = current_doctor.patients.where(name: 'raza').find_by(id: params[:id])
    @patient = Patient.where(doctor_id: current_doctor.id).find_by(id: params[:id])


    puts "==============================="
    puts "#{current_doctor.id}+#{current_doctor.name}"
    puts "@patient: #{@patient.inspect}" # Debugging statement

    puts "==========================="

  end

  private

  def patient_params
    params.require(:patient).permit(:name, :email, :age)
  end

end
