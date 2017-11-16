module StationMethods


  def station_options
    puts "What are you interested in?"
    puts "1. Most popular starting station"
    puts "2. Most popular ending station"
    puts "3. Most popular station overall"
    puts "4. Back"
    input = gets.chomp
    case input
      when "1"
        most_popular_starting_station
      when "2"
        most_popular_ending_station
      when "3"
        most_popular_overall_station
      when "4"
        first_display_options
      else
        puts "Invalid input"
        station_options
    end
  end


  def most_popular_starting_station(filter = '')
    puts Trip.where(filter).group("start_station_id").order("count(*) DESC").first.start_station.name
    new_filter = demo_filter
    new_filter == "exit" ? first_display_options : most_popular_starting_station(new_filter)
  end

  def most_popular_ending_station(filter = '')
    puts Trip.where(filter).group("end_station_id").order("count(*) DESC").first.end_station.name
    new_filter = demo_filter
    new_filter == "exit" ? first_display_options : most_popular_ending_station(new_filter)
  end

  def most_popular_overall_station(filter = '')
    a = Trip.where(filter).group("start_station_id").order("count(*) DESC").count
    b = Trip.where(filter).group("end_station_id").order("count(*) DESC").count
    # most used station overall
    c = a.merge(b) { |key, o, n| o + n}
    c.sort_by{|k, v| v}
    puts Station.find_by(city_station_id: c.first[0]).name
    new_filter = demo_filter
    new_filter == "exit" ? first_display_options : most_popular_overall_station(new_filter)
  end

end
