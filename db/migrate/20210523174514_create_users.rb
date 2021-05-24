class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.text :bio
      t.string :favorite_systems

      t.timestamps
    end
  end
end
