class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.references :audi, index: true, foreign_key: true
      t.string :row_number
      t.integer :seat_number
      t.timestamps null: false
    end
  end
end
