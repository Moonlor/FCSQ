class AddResultRoSchedules < ActiveRecord::Migration[5.1]
  def change
  	add_column :schedules, :result, 	:string, 	default: ' '
  end
end
