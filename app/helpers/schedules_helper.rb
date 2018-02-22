module SchedulesHelper
  
  require 'csv'

  def cities
  	city = []
  	CSV.read( 'public/airport/airport.csv' ).each do |row|
  	  city.append [row[0].split("\t")[0], row[0].split("\t")[0]]
  	end
  	return city
  end

  def city_number
    total = (0..8).to_a
    total.map { |number| [number, number] }
  end
end
