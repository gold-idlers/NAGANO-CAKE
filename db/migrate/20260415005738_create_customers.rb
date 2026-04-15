class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :email_address, null: false
      t.string :password_digest, null: false
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :postal_code
      t.string :address
      t.string :phone_number
      t.boolean :is_active, default: true, null: false

      t.timestamps
    end
    add_index :customers, :email_address, unique: true
  end
end