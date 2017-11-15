class CitiBike

  # top level stats in each category

  def start
    first_display_options
  end

  def first_display_options
    puts "What are you interested in?"
    puts "1. Stations"
    puts "2. Trips"
    puts "3. Bikes"
    puts "4. User Demographics" # Think about taking this out
    puts "5. Exit"
    input = gets.chomp
    case input
    when "1"
      station_options
    when "2"
      trip_options
    when "3"
      bike_options
    when "4"
      user_options
    when "5"
      puts "Goodbye"
    else
      puts "Invalid input"
      first_display_options
    end
  end

  def station_options
    puts "What are you interested in?"
    puts "1. Most popular starting station"
    puts "2. Most popular ending station"
    puts "3. Most popular station overall"
    puts "4. Back"
    input = gets.chomp
    case input
    when "1"
      station_options
    when "2"
      trip_options
    when "3"
      bike_options
    when "4"
      first_display_options
    else
      puts "Invalid input"
      station_options
    end
  end

  def trip_options
    puts "What are you interested in?"
    puts "1. Most popular trip"
    puts "2. Average trip duration"
    puts "3. Longest trip duration (and how much it cost)"
    puts "4. Back"
    input = gets.chomp
    case input
    when "1"
      puts "The most popular trips are:"
      most_popular_trip # parse
      # do we want people to be able to double-click on those trips? Prob not
      # need to parse result
      demo_filter
    when "2"
      trip_filter(2) # needs to be fixed
    when "3"
      bike_options
    when "4"
      first_display_options
    else
      puts "Invalid input"
      trip_options
    end
  end

  def demo_filter
    # take the prior level's sql query and add a 'where' filter to it
    # return the string that becomes the where clause
    puts "Want to filter?"
    puts "1. Female subscribers"
    puts "2. Male subscribers"
    puts "3. Non-subscribers"
    puts "4. Back"
    # add age group information
    input = gets.chomp
    case input
    when "1"
      'gender = 2'
    when "2"
      'gender = 1'
    when "3"
      "user_type = 'Customer'"
    when "4"
      "exit"
    else
      puts "Invalid input"
      demo_filter
    end
  end

  def most_popular_trip(filter = '')
    puts Trip.where(filter).group("unique_trip_id").order("count(*) DESC").count.first(5)
    new_filter = demo_filter
    if new_filter == "exit"
      first_display_options
    else
      most_popular_trip(new_filter)
    end
  end

  def bike_options
    puts "What are you interested in?"
    puts "1. Bike with the most trips"
    puts "2. Bike with the most riding time"
    puts "3. Back"
    input = gets.chomp
    case input
    when "1"
      station_options
    when "2"
      trip_options
    when "3"
      first_display_options
    else
      puts "Invalid input"
      bike_options
    end
  end

  def user_options
    puts "What are you interested in?"
    puts "1. Female"
    puts "2. Male"
    puts "3. All"
    puts "4. Back"
    input = gets.chomp
    case input
    when "1"
      station_options
    when "2"
      trip_options
    when "3"
      bike_options
    when "4"
      first_display_options
    else
      puts "Invalid input"
      first_display_options
    end
  end
end

# Pry.start
