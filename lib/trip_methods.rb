module TripMethods

  def trip_options
    system "clear" or system "cls"
    puts ""
    puts Paint["Cool, let's chat trips!", :red, :bright]
    puts ""
    puts "What are you interested in?"
    puts "1. Most popular trips"
    puts "2. Average trip duration"
    puts "3. Longest trip (and how much it cost)"
    puts "4. Back"
    puts "5. Exit"
    input = gets.chomp
    case input
    when "1"
      most_popular_trips
    when "2"
      average_trip_duration
    when "3"
      longest_trips
    when "4"
      first_display_options
    when "5"
      exit
    else
      puts "Invalid input"
      trip_options
    end
  end

  def most_popular_trips(filter = '')
    system "clear" or system "cls"
    ff = filter_format(filter)
    puts ""
    puts Paint["The most popular trips #{ff}are:", :red, :bright]
    puts ""
    m = Trip.where(filter).group("unique_trip_id").order("count(*) DESC").count.first(10)
    printf("%2s  %-30s %-10s\n", '', "Start Station", "End Station")
    station_parser(m)
    puts ""
    new_filter = demo_filter
    new_filter == "exit" ? trip_options : most_popular_trips(new_filter)
  end

  def average_trip_duration(filter = '')
    system "clear" or system "cls"
    ff = filter_format(filter)
    puts ""
    puts Paint["The average trip duration #{ff}is:", :red, :bright]
    puts ""
    s = Trip.where(filter).average("duration").truncate
    puts seconds_to_days_hours_mins(s)
    puts ""
    new_filter = demo_filter
    new_filter == "exit" ? trip_options : average_trip_duration(new_filter)
  end

  def longest_trips(filter = '') ## put out 10 longest trips
    system "clear" or system "cls"
    ff = filter_format(filter)
    puts ""
    puts Paint["The longest trips #{ff}were:", :red, :bright]
    puts ""
    s = Trip.where(filter).order("duration DESC").limit(10) ### order by and return top 5
    # show all the trip start / stops
    printf("%2s  %-30s %-30s %-50s %-10s\n", '', "Start Station", "End Station", "Duration", "Late Fee")
    s.each_with_index do |obj, i|
      sst = obj.start_station_id
      est = obj.end_station_id
      sst_name = Station.where("city_station_id = #{sst}")[0].name
      est_name = Station.where("city_station_id = #{est}")[0].name
      dur = obj.duration
      # puts "#{i + 1}. #{sst_name} to #{est_name}: #{seconds_to_days_hours_mins(dur)}, #{late_fee(dur)}"
      printf("%2s. %-30s %-30s %-50s %-10s\n", i + 1, sst_name, est_name, seconds_to_days_hours_mins(dur), late_fee(dur))
    end
    puts ""
    new_filter = demo_filter
    new_filter == "exit" ? trip_options : longest_trips(new_filter)
  end

end
