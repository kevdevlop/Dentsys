class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :user_type
      t.boolean :is_active
      t.integer :sign_in_count

      t.timestamps
    end
  end
end
