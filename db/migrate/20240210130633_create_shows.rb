class CreateShows < ActiveRecord::Migration[7.1]
  def change
    create_table :shows do |t|
      t.references :movie, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :total_seats
      t.integer :available_seats

      t.timestamps
    end
  end
end
