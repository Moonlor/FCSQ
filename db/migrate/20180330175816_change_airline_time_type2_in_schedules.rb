class ChangeAirlineTimeType2InSchedules < ActiveRecord::Migration[5.1]
  def change
  	
  	remove_column 	:schedules, 	:latest_arv_hourminute, 		:string

  	add_column :schedules, 	:latest_arv_minute, :string, 	default: '59'
  end
end
