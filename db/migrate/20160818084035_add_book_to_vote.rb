class AddBookToVote < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :book, foreign_key: true
  end
end
