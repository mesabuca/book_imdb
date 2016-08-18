class AddAuthorToBook < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :author, foreign_key: true
  end
end
