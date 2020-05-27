class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :address
      t.string :phone_number
      t.string :mobile_number
      t.datetime :birthdate
      t.references :user, foreign_key: true
      t.references :branch_office, null: false, foreign_key: true

      t.timestamps
    end
  end
end
