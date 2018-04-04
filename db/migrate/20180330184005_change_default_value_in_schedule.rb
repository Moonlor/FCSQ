class ChangeDefaultValueInSchedule < ActiveRecord::Migration[5.1]
  def change
  	change_column :schedules, :highest_price, 	:integer, 	default: 500
  	change_column :schedules, :lowest_price, 	:integer, 	default: 100
  end
end
