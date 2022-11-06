class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :post_code
      t.text :address
      t.string :phone_number
      t.string :sex
      t.date :birthday

      t.timestamps
    end
  end
end
