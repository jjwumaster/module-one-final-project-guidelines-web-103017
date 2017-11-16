module StationMethods

  def station_options
    system "clear" or system "cls"
    puts ""
    puts Paint["Cool, let's chat stations!", :red, :bright]
    puts ""
    puts "What are you interested in?"
    puts "1. Most popular starting station"
    puts "2. Most popular ending station"
    puts "3. Most popular station overall"
    puts "4. Back"
    input = gets.chomp
    case input
    when "1"
      most_popular_starting_stations
    when "2"
      most_popular_ending_stations
    when "3"
      most_popular_overall_stations
    when "4"
      first_display_options
    else
      puts "Invalid input"
      station_options
    end
  end

  def most_popular_starting_stations(filter = '')
    ff = filter_format(filter)
    system "clear" or system "cls"
    puts ""
    puts Paint["The most popular starting stations #{ff}are:", :red, :bright]
    puts ""
    top_five = Trip.group("start_station_id").having(filter).order("count(*) DESC").first(5) # changed to having

    printf("%2s  %-30s %-4s\n", '', "Start Station", "Trip Starts")
    top_five.each_with_index do |obj, i|
      sname = station_name(obj.start_station_id)
      trips_taken = Trip.where("start_station_id = #{obj.start_station_id}").count
      printf("%2s. %-30s %-4s\n", i + 1, sname, trips_taken)
    end

    puts ""
    new_filter = demo_filter
    new_filter == "exit" ? station_options : most_popular_starting_stations(new_filter)
  end

  def most_popular_ending_stations(filter = '')
    ff = filter_format(filter)
    system "clear" or system "cls"
    puts ""
    puts Paint["The most popular ending stations #{ff}are:", :red, :bright]
    puts ""
    bottom_five = Trip.group("end_station_id").having(filter).order("count(*) DESC").first(5)

    printf("%2s  %-35s %-4s\n", '', "End Station", "Trip Starts")
    bottom_five.each_with_index do |obj, i|
      sname = station_name(obj.end_station_id)
      trips_taken = Trip.where("end_station_id = #{obj.end_station_id}").count
      printf("%2s. %-35s %-4s\n", i + 1, sname, trips_taken)
    end

    puts ""
    new_filter = demo_filter
    new_filter == "exit" ? station_options : most_popular_ending_stations(new_filter)
  end

  def most_popular_overall_stations(filter = '')
    ff = filter_format(filter)
    system "clear" or system "cls"
    puts ""
    puts Paint["The most popular stations #{ff}are:", :red, :bright]
    puts ""
    a = Trip.group("start_station_id").having(filter).order("count(*) DESC").count
    b = Trip.group("end_station_id").having(filter).order("count(*) DESC").count
    c = a.merge(b) { |key, o, n| o + n} # USE THIS

    top_five = c.sort_by{|k, v| v}[-5..-1]
    printf("%2s  %-50s %-4s\n", '', "Station Name", "Trip Starts")
    top_five.reverse.each_with_index do |obj, i|
      sname = station_name(obj[0])
      trip_starts = Trip.where("start_station_id = #{obj[0]}").count
      trip_ends = Trip.where("end_station_id = #{obj[0]}").count
      printf("%2s. %-50s %-4s\n", i + 1, sname, trip_starts + trip_ends)
    end

    puts ""
    new_filter = demo_filter
    new_filter == "exit" ? station_options : most_popular_overall_stations(new_filter)
  end

end
