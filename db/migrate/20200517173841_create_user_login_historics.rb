class CreateUserLoginHistorics < ActiveRecord::Migration[6.0]
  def change
    create_table :user_login_historics do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :device_type
      t.string :signin_ip
      t.string :user_agent

      t.timestamps
    end
  end
end
