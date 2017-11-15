require_relative '../config/environment'

binding.pry

##### BIKES

# bike with the most trips
Trip.all.group("city_bike_id").count.sort_by {|k,v|v}.last

# bike with the least trips

# bike with the longest duration ridden

# bike with the shortest duration ridden

##### USERS

# mix of users, male and female

# within male / female / all users, average age

# mix of cust / subscribers

##### TRIPS

# most common trip

# least common trip

# longest / shortest / avg trip duration

##### STATIONS

# favorite / least favorite start/end/overall station
