class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :razon_social
      t.string :rfc
      t.string :state
      t.string :city
      t.string :zip_code
      t.string :address
      t.string :phone_number
      t.string :mobile_number
      t.string :logo
      t.boolean :active

      t.timestamps
    end
  end
end
