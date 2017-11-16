module TripMethods

  def trip_options
    system "clear" or system "cls"
    puts Paint["Cool, let's chat trips", :red, :bright]
    puts "What are you interested in?"
    puts "1. Most popular trips"
    puts "2. Average trip duration"
    puts "3. Longest trip (and how much it cost)"
    puts "4. Back"
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
    else
      puts "Invalid input"
      trip_options
    end
  end

  def most_popular_trip(filter = '')
    system "clear" or system "cls"
    output = ''
    case filter
    when ''

    when 'gender = 1'

    when 'gender = 2'

    else

    end

    puts Paint["The most popular trip#{filter} is:", :red]
    m = Trip.where(filter).group("unique_trip_id").order("count(*) DESC").count.first(5)
    parser(m)
    puts ""
    new_filter = demo_filter
    new_filter == "exit" ? first_display_options : most_popular_trip(new_filter)
  end

  def average_trip_duration(filter = '')
    system "clear" or system "cls"
    s = Trip.where(filter).average("duration").truncate
    puts seconds_to_days_hours_mins(s)
    puts ""
    new_filter = demo_filter
    new_filter == "exit" ? first_display_options : average_trip_duration(new_filter)
  end

  def longest_trip(filter = '')
    system "clear" or system "cls"
    s = Trip.where(filter).maximum("duration").truncate
    puts seconds_to_days_hours_mins(s)
    puts late_fee(s)
    puts ""
    new_filter = demo_filter
    new_filter == "exit" ? first_display_options : longest_trip(new_filter)
  end

end
