class Medicine < ApplicationRecord
  belongs_to :prescription
  validates :name, :dosage, :duration, :frequency, presence: true
 end
