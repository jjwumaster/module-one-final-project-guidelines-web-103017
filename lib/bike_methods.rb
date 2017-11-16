module BikeMethods

  # def bike_options
  #   system "clear" or system "cls"
  #   puts "What are you interested in?"
  #   puts "1. What's the village bicycle (bike with the most rides)?" # edit text
  #   puts "2. Back"
  #   input = gets.chomp
  #   case input
  #   when "1"
  #     bike_most_trips
  #   when "2"
  #     first_display_options
  #   else
  #     puts "Invalid input"
  #     bike_options
  #   end
  # end

  def bike_most_trips
    system "clear" or system "cls"
    puts ""
    puts Paint["The bike with the most trips this month is:", :red, :bright]
    puts ""
    bike = Trip.group("city_bike_id").order("count(*) DESC").first.city_bike_id
    puts "Bike ID: #{bike}, Name: 'Billy'"
    puts ""
    i = 1
    printf("%2s  %-30s %-30s %-30s %-30s\n", '', "Start Station", "End Station", "Start Time", "End Time")
    Bike.find_by(city_bike_id: bike).trips.order("start_time").each do |trip|
      printf("%2s. %-30s %-30s %-30s %-30s\n", i, trip.start_station.name, trip.end_station.name, trip.start_time, trip.end_time)
      i += 1
    end
    puts "Press ENTER to return to main menu"
    gets.chomp
    first_display_options
  end

  # def bike_most_time
  #   system "clear" or system "cls"
  #   puts ""
  #   puts Paint["The bikes ridden for the most time this month are:", :red, :bright]
  #   puts ""
  #     #puts b_time = Trip.group("city_bike_id").order("sum(duration) DESC").first.city_bike_id
  #     puts "Bike No. #{Trip.group("city_bike_id").order("sum(duration) DESC").first.city_bike_id} has ridden for #{seconds_to_days_hours_mins(Trip.group("city_bike_id").order("sum(duration) DESC").first.duration)}."
  #     #display_trips?(b_time)
  # end

end
