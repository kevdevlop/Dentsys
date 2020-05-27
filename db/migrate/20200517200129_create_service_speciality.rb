class CreateServiceSpeciality < ActiveRecord::Migration[6.0]
  def change
    create_table :service_specialities do |t|
      t.belongs_to :service, null: false, index: true
      t.belongs_to :speciality, null: false, index: true
    end
  end
end
