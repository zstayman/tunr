class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :gender
      t.text :email
      t.text :facebook_link
      t.string :password
    end
  end
end

