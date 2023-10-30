class Prescription < ApplicationRecord
  belongs_to :visit
  has_many :medicines
end
