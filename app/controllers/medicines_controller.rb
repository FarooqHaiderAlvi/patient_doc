class MedicinesController < ApplicationController
  before_action :find_prescription, only: [:create]
  before_action :find_visit, only: [:show]

  def create
    # before action find prescription
    @medicine = @prescription.medicines.create(medicine_params)
    visit=@prescription.visit
    if @medicine.save
      redirect_to new_appointment_visit_path(visit.appointment_id)
    else
      render 'visits/show', status: :unprocessable_entity
    end

  end

  def show
    # before action find visit
    @medicines=@visit.prescription.medicines
     @patient=@visit.appointment.patient
    pdf = WickedPdf.new.pdf_from_string(
      render_to_string('show', layout: false))
    send_data(pdf,
              filename: 'download.pdf',
              type: 'application/pdf',
              disposition: 'attachment')
  end

  private

  def find_visit
    @visit=Visit.find_by(id: params[:id])
  end
  def find_prescription
    @prescription = Prescription.find(params[:prescription_id])
  end
  def medicine_params
    params.require(:medicine).permit(:name, :dosage, :frequency, :duration)
  end
end
