class Doctor < User
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "password", "type", "updated_at", "email", "reset_password_token_cont", "reset_password_token_eq", "reset_password_token_start", "reset_password_token_end"]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :name, presence: true

end
