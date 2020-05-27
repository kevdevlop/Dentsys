class CreateClinicHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :clinic_histories do |t|
      t.string :diagnostic
      t.string :observations
      t.references :patient, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
