class ChangeIsstopInSchedules < ActiveRecord::Migration[5.1]
  def change
  	change_column :schedules, :isstop, 		:string, 	default: '0'
  	change_column :schedules, :flight_day, 	:string, 	default: '0'
  end
end
