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

  def city_name2code(name)
    j = JSON.parse(File.read('public/airport/city_list.json'))
    for each in j['热门']
      if each['display'] == name
        return each['code']
      end
    end
  end

  def flight_url(d_city, a_city, date)
    str1 = 'http://u.ctrip.com/union/CtripRedirect.aspx?TypeID=2&Allianceid=819219&sid=1381943&OUID=&jumpUrl=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2Fflight%2Fswift%2Fdomestic%2F'
    str2 = '%2F'
    str3 = '%2F'
    str4 = '%3FAllianceid%3D819219%26sid%3D1381943%26OUID%3D%26MultiUnionSupport%3Dtrue'

    pp str1 + city_name2code(d_city) + str2 + city_name2code(a_city) + str3 + date + str4

    return str1 + city_name2code(d_city) + str2 + city_name2code(a_city) + str3 + date + str4
  end

end
