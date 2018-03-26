class ChangeOntimeRateInSchedules < ActiveRecord::Migration[5.1]
  def change
  	change_column :schedules, :ontime_rate, 	:float, 	default: 55
  end
end
