class ChangeIsbnColumnOnBooks < ActiveRecord::Migration[7.1]
  def change
    remove_index  :books, :isbn
    change_column :books, :isbn, :string
    add_index     :books, :isbn
  end
end
