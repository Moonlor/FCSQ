class ChangeAirlineTimeTypeInSchedules < ActiveRecord::Migration[5.1]
  def change

  	remove_column 	:schedules, 	:earliest_dept_time, 	:time
  	remove_column 	:schedules, 	:latest_arv_time, 		:time

  	add_column :schedules, 	:earliest_dept_hour, 	:string, 	default: '0'
  	add_column :schedules, 	:latest_arv_hour, 		:string, 	default: '23'

  	add_column :schedules, 	:earliest_dept_minute, 	:string, 	default: '0'
  	add_column :schedules, 	:latest_arv_hourminute, :string, 	default: '59'
  end
end
