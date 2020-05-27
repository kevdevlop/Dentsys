class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :observations
      t.boolean :confirmed
      t.boolean :active
      t.boolean :reminder_activated
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
