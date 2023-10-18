class UndergroundSystem
  def initialize
    @check_in_data  = {}
    @travel_data = Hash.new { |hash, key| hash[key] = [0, 0] }
  end

  def check_in(id, station_name, time)
    @check_in_data[id] = [station_name, time]
  end

  def check_out(id, station_name, time)
    start_station, start_time = @check_in_data.delete(id)
    journey = [start_station, station_name]
    total_time, travel_count = @travel_data[journey]
    @travel_data[journey] = [total_time + time - start_time, travel_count + 1]
  end

  def get_average_time(start_station, end_station)
    total_time, travel_count = @travel_data[[start_station, end_station]]
    total_time.to_f / travel_count
  end
end
