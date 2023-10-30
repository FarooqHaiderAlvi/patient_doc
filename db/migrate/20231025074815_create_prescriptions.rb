class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.string :description
      t.references :visit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
