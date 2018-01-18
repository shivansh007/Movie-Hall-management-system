class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.date :release_date
      t.string :cast
      t.timestamps null: false
    end
  end
end
