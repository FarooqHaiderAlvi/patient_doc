class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable


  # In Ruby on Rails, Ransack is a gem that provides a simple and
  # flexible way to create complex search and
  # filter functionality for your ActiveRecord models.
    def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "remember_created_at", "reset_password_sent_at", "updated_at"]
  end

end 
