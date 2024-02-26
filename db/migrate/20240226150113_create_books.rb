class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.bigint :isbn
      t.text :description
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
    add_index :books, :title
    add_index :books, :isbn
  end
end
