module HelperMethods

  def station_name(id)
    Station.where("city_station_id = #{id}")[0].name
  end

  def exit
    system "clear" or system "cls"
    puts "Thanks for coming by! Peace, love, and bicycles" # weird bug not quitting
  end

  def perc(x, y)
    ( (x.to_f / y.to_f) * 100 ).round(1)
  end

  def format_comma(number, delimiter = ',')
    number.to_s.reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1#{delimiter}").reverse
  end

  def filter_format(filter)
    case filter
    when ''
      "overall "
    when 'gender = 1'
      "for men "
    when 'gender = 2'
      "for women "
    else
      "for non-subscribers "
    end
  end

  def seconds_to_days_hours_mins(t)
    mm, ss = t.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]
  end

  def station_parser(array)
    array.each_with_index do |arr, i|
      sst = arr[0].split(' ')[0]
      est = arr[0].split(' ')[1]
      t = arr[1]
      printf("%2s. %-30s %-10s\n", i + 1, station_name(sst), station_name(est))

    end
  end

  # def trip_parser(objects) # yes we're doing this for trips
  #   objects.each_with_index do |obj, i|
  #     duration = obj.duration
  #     puts "#{i + 1}. " ## NEED TO FIX THIS
  #   end
  # end

  def late_fee(seconds)
    minutes = seconds / 60.0
    charged_minutes = minutes - 45.0
    ride_cost = charged_minutes * 2.50
    "$#{format_comma(ride_cost.round(2))}"
  end

end
