require 'paint'

class CitiBike

  # top level stats in each category

  include HelperMethods
  include TripMethods

  def start
    first_display_options
  end

  #{Trip.where("gender = 2").count}

  def first_display_options
    banner = File.read('lib/citibike.txt')
    t_trips = Trip.count
    w_trips = Trip.where("gender = 2").count
    m_trips = Trip.where("gender = 1").count
    n_trips = Trip.where("gender = 0").count
    sub_trips = Trip.where("user_type = 'Subscriber'").count
    cust_trips = Trip.where("user_type = 'Customer'").count
    uniq_bikes = Bike.all.count
    system "clear" or system "cls"
    puts ""
    puts banner
    puts ""
    puts Paint["Welcome to CitiBike Analytics!)", :red, :bright]
    puts "There were #{format_comma(t_trips)} rides in the month of September on #{format_comma(uniq_bikes)} unique bikes!"
    puts ""
    puts "#{perc(sub_trips, t_trips)}% of rides were taken by loyal subscribers"
    puts "Non-subscribers (probably tourists, ew) took the remaining #{perc(cust_trips, t_trips)}% of rides"
    puts ""
    puts "Of subscriber rides, #{perc(w_trips, sub_trips)}% were taken by women and #{perc(m_trips, sub_trips)}% were taken by men."
    puts "(#{perc(n_trips, sub_trips)}% of subscribers didn't list their genders)"
    puts ""
    puts "Want to learn more? Tell us what you're interested in:"
    puts ""
    puts "1. Stations (...what's the most popular station?)"
    puts "2. Trips (...what's the most popular trip?)"
    puts "3. Bikes (...which bike got ridden the most?)"
    puts "4. User Demographics (...)" # Think about taking this out
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
      exit
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

  def demo_filter
    # take the prior level's sql query and add a 'where' filter to it
    # return the string that becomes the where clause
    puts "Want to filter?"
    puts "1. Female subscribers"
    puts "2. Male subscribers"
    puts "3. Non-subscribers"
    puts "4. I'm good, take me back"
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
      first_display_options
    else
      puts "Invalid input"
      demo_filter
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
