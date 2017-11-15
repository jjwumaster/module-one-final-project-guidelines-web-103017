require_relative '../config/environment'


#### LATE FEE CALCULATOR

def late_fee(seconds)
  minutes = seconds / 60.0
  charged_minutes = minutes - 45.0
  ride_cost = charged_minutes * 2.50
  ride_cost
end

##### BIKES

# bike with the most trips
Trip.group("city_bike_id").order("count(*) DESC").first.city_bike_id
Trip.group("city_bike_id").order("count(*) DESC").first.duration

# bike with the longest duration ridden
longest = Trip.group("city_bike_id").order("sum(duration) DESC")[0..10]

# call late_fee on this

##### USERS

# mix of users, male and female
Trip.group("gender").count
# => {0=>403, 1=>7351, 2=>2247}

# Avg age of all users
Trip.where("user_type = 'Subscriber'").where("birth_year != 0").average("birth_year").truncate
# => 1979

# Avg age of all males
Trip.where("gender = 1").where("birth_year != 0").average("birth_year").truncate
# => 1978

# Avg age of all females
Trip.where("gender = 2").where("birth_year != 0").average("birth_year").truncate
# => 1980

# Avg duration of all males
Trip.where("gender = 1").average("duration").truncate
# => 867

# Avg duration of all females
Trip.where("gender = 2").average("duration").truncate
# => 797

# Avg duration of all
Trip.where("gender != 0").average("duration").truncate
# => 851

# mix of cust / subscribers
Trip.where("user_type = 'Subscriber'").count
# => 9657

Trip.where("user_type = 'Customer'").count
# => 344

##### TRIPS

# most common trip
Trip.group("start_station_id, end_station_id").count.sort_by{|k,v|v}.reverse.first
# 432-3263
Trip.group("start_station_id, end_station_id").order("count(*) DESC").first

##### STATIONS

# most used start station
Trip.group("start_station_id").order("count(*) DESC").count
Trip.group("start_station_id").order("count(*) DESC").first.start_station.name

# most used station overall
