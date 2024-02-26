class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :username
  end
end
