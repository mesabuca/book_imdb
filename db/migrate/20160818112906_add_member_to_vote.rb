class AddMemberToVote < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :member, foreign_key: true
  end
end
