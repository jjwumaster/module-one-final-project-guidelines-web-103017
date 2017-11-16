module HelperMethods

  def station_name(id) # CONSIDER MOVING TO A SUPERCLASS
    Station.where("city_station_id = #{id}")[0].name
  end

  def perc(x, y)
    ( (x.to_f / y.to_f) * 100 ).round(1)
  end

  def format_comma(number)
    number.to_s.chars.to_a.reverse.each_slice(3).map(&:join).join(",").reverse
  end

  def filter_format(filter)
    case filter
    when ''

    when 'gender = 1'

    when 'gender = 2'

    else

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

  def late_fee(seconds)
    minutes = seconds / 60.0
    charged_minutes = minutes - 45.0
    ride_cost = charged_minutes * 2.50
    ride_cost
  end

end
