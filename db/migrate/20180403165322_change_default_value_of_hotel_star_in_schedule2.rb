class ChangeDefaultValueOfHotelStarInSchedule2 < ActiveRecord::Migration[5.1]
  def change
  	change_column :schedules, :hotel_type, 	:string, 	default: '无要求'
  end
end
