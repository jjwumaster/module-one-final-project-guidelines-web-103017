class Station < ActiveRecord::Base
  has_many :start_trips, class_name: 'Trip', foreign_key: 'start_station_id', primary_key: 'city_station_id'
  has_many :end_trips, class_name: 'Trip', foreign_key: 'end_station_id', primary_key: 'city_station_id'
  # have to come back and make it so that station can be associated with trips either as a start or end station
  has_many :bikes, through: :trips

  def all_trips
    (self.start_trips + self.end_trips).uniq
  end

  # def self.most_popular_station
  #   self.all.sort_by{ |s| s.all_trips.length}.last
  # end
  # 
  # def self.most_popular_station
  #   Station.find_in_batches do |stations|
  #     export.add_invoices(invoices)
  #   end
  # end



end
