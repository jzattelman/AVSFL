class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.boolean :admin

      t.timestamps
    end
  end
end
