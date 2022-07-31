class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, blank: true
      t.string :email, null: false, unique: true, blank: false
      t.integer :phone, blank: true
      t.integer :profile_type, default: 0
      t.string :password_digest
      t.string :token

      t.timestamps
    end
    add_index :users, :token, unique: true
  end
end
