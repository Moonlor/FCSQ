class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :depart_city
      t.string :final_city
      t.integer :via_city_number
      t.date :depart_date
      t.date :final_date
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
    add_index :schedules, [:user_id, :created_at]
  end
end
