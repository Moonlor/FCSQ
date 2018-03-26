class ChangeTypesInSchedules < ActiveRecord::Migration[5.1]
  def change
  	change_column :schedules, :hotel_type, 	:string, 	default: '经济型'
  end
end
