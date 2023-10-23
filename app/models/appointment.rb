class Appointment < ApplicationRecord

  belongs_to :doctor
  belongs_to :patient
  validates :appointment_date, presence: true
  validate :past_appointment_date
  validate :doctor_or_patient_has_no_appointment

  private

  def doctor_or_patient_has_no_appointment
    if doctor && !appointment_date.blank?
      existing_appointments = doctor.appointments.where("appointment_date >= ? AND appointment_date <= ?", appointment_date - 1.hour, appointment_date + 1.hour)

      if existing_appointments.exists?
        errors.add(:appointment_date, "Doctor already has an appointment with this date")
      end
    end

    if patient && !appointment_date.blank?
      existing_appointments = patient.appointments.where("appointment_date >= ? AND appointment_date <= ?", appointment_date - 1.hour, appointment_date + 1.hour)

      if existing_appointments.exists?
        errors.add(:appointment_date, "Patient already has an appointment with this date")
      end
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["appointment_date", "created_at", "doctor_id", "id", "patient_id", "updated_at"]
  end

  def past_appointment_date
    if !appointment_date.blank? && appointment_date < DateTime.now
      errors.add(:appointment_date, " can't be in the past")
    end
  end
end
