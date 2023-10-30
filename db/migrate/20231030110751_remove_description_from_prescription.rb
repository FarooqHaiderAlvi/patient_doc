class RemoveDescriptionFromPrescription < ActiveRecord::Migration[7.0]

  def change
    remove_column :prescriptions, :description, :string
  end

end
