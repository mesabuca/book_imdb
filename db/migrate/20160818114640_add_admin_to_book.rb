class AddAdminToBook < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :admin, foreign_key: true
  end
end
