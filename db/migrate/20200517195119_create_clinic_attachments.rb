class CreateClinicAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :clinic_attachments do |t|
      t.string :file
      t.references :clinic_history, null: false, foreign_key: true

      t.timestamps
    end
  end
end
