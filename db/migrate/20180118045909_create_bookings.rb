class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.time :booking_time
      t.timestamps null: false
    end
  end
end
