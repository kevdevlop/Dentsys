class CreateSpecialityDoctor < ActiveRecord::Migration[6.0]
  def change
    create_table :speciality_doctors do |t|
      t.belongs_to :speciality, null: false, index: true
      t.belongs_to :doctor, null: false, index: true
    end
  end
end
