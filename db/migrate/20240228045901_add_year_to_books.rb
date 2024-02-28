class AddYearToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :year, :integer
  end
end
