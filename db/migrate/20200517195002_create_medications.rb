class CreateMedications < ActiveRecord::Migration[6.0]
  def change
    create_table :medications do |t|
      t.string :medicament
      t.integer :quantity
      t.integer :dosis
      t.string :frecuency
      t.integer :duration
      t.string :sustancy
      t.references :clinic_history, null: false, foreign_key: true

      t.timestamps
    end
  end
end
