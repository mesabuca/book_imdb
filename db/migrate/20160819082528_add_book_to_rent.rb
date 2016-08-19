class AddBookToRent < ActiveRecord::Migration[5.0]
  def change
    add_reference :rents, :book, foreign_key: true
  end
end
