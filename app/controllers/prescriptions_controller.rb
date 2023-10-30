class PrescriptionsController < ApplicationController

  def create
    @visit = Visit.find(params[:visit_id])
    @prescription = @visit.build_prescription
    if  @prescription.save
      redirect_to new_appointment_visit_path(@visit.appointment_id)
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(:description)
  end

end
