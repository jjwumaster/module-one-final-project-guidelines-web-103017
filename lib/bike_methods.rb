module BikeMethods

  def bike_options
    puts "What are you interested in?"
    puts "1. Bike with the most trips"
    puts "2. Bike with the most riding time"
    puts "3. Back"
    input = gets.chomp
    case input
    when "1"
      bike_most_trips
    when "2"
      bike_most_time
    when "3"
      first_display_options
    else
      puts "Invalid input"
      bike_options
    end
  end

  def bike_most_trips
    puts b_trips = Trip.group("city_bike_id").order("count(*) DESC").first.city_bike_id
    display_trips?(b_trips)

  end

  def bike_most_time
      #puts b_time = Trip.group("city_bike_id").order("sum(duration) DESC").first.city_bike_id
      puts "Bike No. #{Trip.group("city_bike_id").order("sum(duration) DESC").first.city_bike_id} has ridden for #{seconds_to_days_hours_mins(Trip.group("city_bike_id").order("sum(duration) DESC").first.duration)}."
      #display_trips?(b_time)
  end

  def display_trips?(bike)
    puts "Would you like to see all the trips this bike made in the month?  (Y/N)"
    input = gets.chomp.downcase
    if input != "y"
        first_display_options
    else
      i = 1
      Bike.find_by(city_bike_id: bike).trips.order("start_time").each do |trip|
        puts "#{i}. Start station:   #{trip.start_station.name}.     End Station: #{trip.end_station.name}."
        i += 1
      end
    end
  end


end
