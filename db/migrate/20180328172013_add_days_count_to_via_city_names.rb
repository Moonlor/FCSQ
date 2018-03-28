class AddDaysCountToViaCityNames < ActiveRecord::Migration[5.1]
  def change
  	add_column :via_city_names, :stay_days, 	:integer, 	default: 2
  end
end
