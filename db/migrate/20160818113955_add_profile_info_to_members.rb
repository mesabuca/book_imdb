class AddProfileInfoToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :first_name, :string
    add_column :members, :last_name, :string
    add_column :members, :phone_number, :string
    add_column :members, :birth_day, :date
    add_column :members, :gender, :string
  end
end
