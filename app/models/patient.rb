
class Patient < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :age,  presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to:100 }
  belongs_to :doctor
  validates_format_of :email, :with => /\A[a-zA-Z.-]+@[^@\s]+\.[a-z]+\z/
  before_save :capitalize

  def capitalize
    self.name=name.capitalize
  end

end