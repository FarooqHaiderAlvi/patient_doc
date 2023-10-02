class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
          :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "email","email","updated_at","reset_password_token_cont", "reset_password_token_eq","reset_password_token_start","reset_password_token_end"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
