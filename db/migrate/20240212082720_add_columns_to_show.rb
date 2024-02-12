class AddColumnsToShow < ActiveRecord::Migration[7.1]
  def change
    add_reference :shows, :theater, null: false, foreign_key: true
    add_column :shows, :show_date, :date
    change_column :shows, :start_time, :string
    change_column :shows, :end_time, :string
  end
end
