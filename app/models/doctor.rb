class Doctor < User
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "password", "type", "updated_at", "username"]
  end


    # Other attributes and methods here

  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :name, presence: true
  validates :username, presence: true


end
