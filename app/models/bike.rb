class Bike < ActiveRecord::Base
  has_many :trips, foreign_key: 'city_bike_id', primary_key: 'city_bike_id'


  has_many :stations, through: :trips # do we need to add start/end stations
end
