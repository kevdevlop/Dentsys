class CreateBranchOffices < ActiveRecord::Migration[6.0]
  def change
    create_table :branch_offices do |t|
      t.references :client, null: false, index: true
      t.references :state_catalogue, null: false, index: true
      t.string :name
      t.string :razon_social
      t.string :rfc
      t.string :city
      t.string :zip_code
      t.string :address
      t.string :logo
      t.boolean :active

      t.timestamps
    end
    add_foreign_key :branch_offices, :state_catalogues
    add_foreign_key :branch_offices, :clients
  end
end
