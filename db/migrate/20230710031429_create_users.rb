class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :hash_id
      t.string :email
      t.string :password_master
      t.string :cpf
      t.string :phone

      t.timestamps
    end
  end
end
