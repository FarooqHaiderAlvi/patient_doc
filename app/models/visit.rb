class Visit < ApplicationRecord
  belongs_to :appointment
  validates :has_visited, acceptance: { accept: true }
  has_one :prescription
end
