class DoctorsController < ApplicationController

  before_action :authenticate_doctor!
  def dashboard
  end
end
