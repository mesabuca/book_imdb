class CreateRents < ActiveRecord::Migration[5.0]
  def change
    create_table :rents do |t|
      t.datetime :date_of_receipt

      t.timestamps
    end
  end
end
