class CreateShowTimes < ActiveRecord::Migration
  def change
    create_table :show_times do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :audi
      t.time :start_time
      t.time :run_time
      t.timestamps null: false
    end
  end
end
