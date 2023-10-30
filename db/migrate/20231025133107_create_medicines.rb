class CreateMedicines < ActiveRecord::Migration[7.0]
  def change
    create_table :medicines do |t|
      t.string :name
      t.integer :frequency
      t.integer :dosage
      t.integer :duration
      t.references :prescription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
