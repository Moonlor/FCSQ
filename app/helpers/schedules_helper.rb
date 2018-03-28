module SchedulesHelper
  
  require 'csv'

  def cities
  	city = []
  	# CSV.read( 'public/airport/airport.csv' ).each do |row|
  	  # city.append [row[0].split("\t")[0], row[0].split("\t")[0]]
  	# end

    j = JSON.parse(File.read('public/airport/city_list.json'))
    for each in j['热门']
      city.append [each['display'], each['display']]
    end


  	return city
  end

  def city_number
    total = (0..8).to_a
    total.map { |number| [number, number] }
  end
end
