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
      system "clear" or system "cls"
      puts "The most popular trips are:"
      # do we want people to be able to double-click on those trips? Prob not
      most_popular_trip
      # demo_filter
    when "2"
      system "clear" or system "cls"
      puts "The average trip is:"
      average_trip_duration
    when "3"
      system "clear" or system "cls"
      longest_trip
    when "4"
      system "clear" or system "cls"
      first_display_options
    when "5"
      exit
    else
      puts "Invalid input"
      trip_options
    end
  end

  def most_popular_trip(filter = '')
    system "clear" or system "cls"
    ff = filter_format(filter)
    puts ""
    puts Paint["The most popular trips #{ff}are:", :red, :bright]
    puts ""
    m = Trip.where(filter).group("unique_trip_id").order("count(*) DESC").count.first(5)
    station_parser(m)
    puts ""
    new_filter = demo_filter
    new_filter == "exit" ? first_display_options : most_popular_trip(new_filter)
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
    new_filter == "exit" ? first_display_options : average_trip_duration(new_filter)
  end

  def longest_trip(filter = '') ## put out 10 longest trips
    system "clear" or system "cls"
    ff = filter_format(filter)
    puts ""
    puts Paint["The longest trips #{ff}were:", :red, :bright]
    puts ""
    s = Trip.where(filter).order("duration").limit(10) ### order by and return top 10
    trip_parser(s)
    puts seconds_to_days_hours_mins(s)
    #puts late_fee(s)
    puts ""
    new_filter = demo_filter
    new_filter == "exit" ? first_display_options : longest_trip(new_filter)
  end

end
