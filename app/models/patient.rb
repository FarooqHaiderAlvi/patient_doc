
class Patient < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :age,  presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to:100 }
   belongs_to :doctor
  validates_format_of :email, :with => /\A[a-zA-Z.-]+@[^@\s]+\.[a-z]+\z/
  before_save :capitalize

  def self.ransackable_attributes(auth_object = nil)
    ["age", "created_at", "doctor_id", "email", "id", "name", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["appointments", "doctor", "doctors"]
  end

  def capitalize
    self.name=name.capitalize
  end
  has_many :appointments
  has_many :doctors, through: :appointments

end