class AddOptionsToSchedules < ActiveRecord::Migration[5.1]
  def change
  	add_column :schedules, :dept_airport, 	:string, 	default: ''
  	add_column :schedules, :arv_airport, 	:string, 	default: ''
  	add_column :schedules, :isstop, 		:integer, 	default: 0
  	add_column :schedules, :flight_day, 	:integer, 	default: 0
  	add_column :schedules, :ontime_rate, 	:float, 	default: 0.2
  	add_column :schedules, :seat_type, 		:string, 	default: '经济舱'
  	add_column :schedules, :earliest_dept_time, 		:time, 		default: '00:00:01'
  	add_column :schedules, :latest_arv_time, 			:time, 		default: '23:59:59'

  	add_column :schedules, :hotel_star, 	:integer, 	default: 3
  	add_column :schedules, :hotel_type, 	:integer, 	default: '经济型'
  	add_column :schedules, :lowest_price, 	:integer, 	default: 70
  	add_column :schedules, :highest_price, 	:integer, 	default: 100
  	add_column :schedules, :hotel_score, 	:float,   	default: 4.2
  	add_column :schedules, :user_recommend, :float, 	default: 0.9
  	add_column :schedules, :user_number, 	:integer, 	default: 20
  end
end
