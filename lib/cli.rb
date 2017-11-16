class CitiBike

  # top level stats in each category
  include StationMethods
  include BikeMethods

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



  def trip_options
    puts "What are you interested in?"
    puts "1. Most popular trips"
    puts "2. Average trip duration"
    puts "3. Longest trip (and how much it cost)"
    puts "4. Back"
    input = gets.chomp
    case input
    when "1"
      puts "The most popular trips are:"
      # do we want people to be able to double-click on those trips? Prob not
      most_popular_trip
      # demo_filter
    when "2"
      puts "The average trip is:"
      average_trip_duration
    when "3"
      # longest trip
    when "4"
      first_display_options
    else
      puts "Invalid input"
      trip_options
    end
  end

  def station_name(id) # CONSIDER MOVING TO A SUPERCLASS
    Station.where("city_station_id = #{id}")[0].name
  end

  def demo_filter
    # take the prior level's sql query and add a 'where' filter to it
    # return the string that becomes the where clause
    puts "Want to filter?"
    puts "1. Female subscribers"
    puts "2. Male subscribers"
    puts "3. Non-subscribers"
    puts "4. Nah, I'm good"
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
    m = Trip.where(filter).group("unique_trip_id").order("count(*) DESC").count.first(5)
    parser(m)
    new_filter = demo_filter
    if new_filter == "exit"
      first_display_options
    else
      most_popular_trip(new_filter)
    end
  end

  def average_trip_duration(filter = '')
    s = Trip.where(filter).average("duration").truncate
    puts seconds_to_days_hours_mins(s)
    new_filter = demo_filter
    if new_filter == "exit"
      first_display_options
    else
      average_trip_duration(new_filter)
    end
  end

  def longest_trip(filter = ‘’)
      s = Trip.where(filter).maximum(“duration”).truncate
      puts seconds_to_days_hours_mins(s)
      new_filter = demo_filter
      if new_filter == “exit”
        first_display_options
      else
        longest_trip(new_filter)
      end
  end

  def seconds_to_days_hours_mins(s) # FIX # CONSIDER MOVING TO A SUPERCLASS
    if s / (60 * 60 * 24) > 0
      days = s / (60 * 60 * 24)
      s = s % (60 * 60 * 24)
    else
      days = 0
      if s / (60 * 60) > 0
        hours = s / (60 * 60)
        s = s % (60 * 60)
      else
        hours = 0
        if s / 60 > 0
          mins = s / 60
          secs = s % 60
        else
          mins = 0
          if s > 0
            secs = s
          else
            secs = 0
          end
        end
      end
    end
    "#{days} days, #{hours} hours, #{mins} minutes, #{secs} seconds"
  end

  def parser(array) # CONSIDER MOVING TO A SUPERCLASS
    array.each_with_index do |arr, i|
      sst = arr[0].split(' ')[0]
      est = arr[0].split(' ')[1]
      t = arr[1]
      puts "#{i + 1}. #{station_name(sst)} to #{station_name(est)}: #{t} trips"
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
