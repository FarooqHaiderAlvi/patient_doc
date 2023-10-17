class Appointment < ApplicationRecord

  belongs_to :doctor
  belongs_to :patient
  validates :appointment_date, presence: true
  validate :appointment_date_cannot_be_in_the_past
  validate :doctor_has_no_other_appointment

  private

  def doctor_has_no_other_appointment
    if doctor && !appointment_date.blank?
      existing_appointments = doctor.appointments.where("appointment_date >= ? AND appointment_date <= ?", appointment_date - 1.hour, appointment_date + 1.hour)

      if existing_appointments.exists?
        errors.add(:appointment_date, "Doctor already has an appointment within one hour of this date")
      end
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["appointment_date", "created_at", "doctor_id", "id", "patient_id", "updated_at"]
  end

  def appointment_date_cannot_be_in_the_past
    if !appointment_date.blank? && appointment_date < DateTime.now
      errors.add(:appointment_date, " can't be in the past")
    end
  end
end
