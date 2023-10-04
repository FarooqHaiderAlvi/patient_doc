class Doctor < ApplicationRecord

  devise :database_authenticatable, :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "email","email","updated_at","reset_password_token_cont", "reset_password_token_eq","reset_password_token_start","reset_password_token_end","patients_id_eq"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  has_many :patients

end
