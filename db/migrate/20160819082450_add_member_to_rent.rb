class AddMemberToRent < ActiveRecord::Migration[5.0]
  def change
    add_reference :rents, :member, foreign_key: true
  end
end
