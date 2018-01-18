class CreateAudis < ActiveRecord::Migration
  def change
    create_table :audis do |t|
      t.references :movie_hall, index: true, foreign_key: true
      t.integer :audi_no
      t.timestamps null: false
    end
  end
end
