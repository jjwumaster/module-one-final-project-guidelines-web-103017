require 'pry'
require 'csv'

# destroy all our objects

Station.destroy_all
Trip.destroy_all
Bike.destroy_all

i = 0

CSV.foreach("lib/seeds/201709-citibike-tripdata.csv") do |row|
  if i > 10
    break
  elsif row[0] == 'tripduration'
  elsif
    Station.find_or_create_by({
      name: row[4],
      latitude: row[5],
      longitude: row[6],
      station_id: row[3]
    })

    Station.find_or_create_by({
      name: row[8],
      latitude: row[9],
      longitude: row[10],
      station_id: row[7]
    })

    Trip.find_or_create_by({
      duration: row[0],
      start_time: row[1],
      end_time: row[2],
      start_station_id: row[3], # should we use their ID's?
      end_station_id: row[7], # should we use their ID's?
      bike_id: row[11],
      user_type: row[12],
      birth_year: row[13],
      gender: row[14]
      })

    Bike.find_or_create_by({
      bike_id: row[11]
      })
    i += 1
  end
end

# ["tripduration",
#  "starttime",
#  "stoptime",
#  "start station id",
#  "start station name",
#  "start station latitude",
#  "start station longitude",
#  "end station id",
#  "end station name",
#  "end station latitude",
#  "end station longitude",
#  "bikeid",
#  "usertype",
#  "birth year",
#  "gender"]
