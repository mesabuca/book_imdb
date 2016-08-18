class AddAuthorToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :author, foreign_key: true
  end
end
