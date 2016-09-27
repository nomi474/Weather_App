require 'barometer'
#require 'barometer-forecast_io'
puts "Enter a location"
location = gets.chomp
def weather_condition(place)
    #puts place
    barometer = Barometer.new(place)
    weather = barometer.measure
    puts weather.forecast.methods
    # temperature.f will display the weather in farenheit
    temperature = weather.current.temperature.f
    #puts temperature
    temp = temperature.to_i
    case temp
    when 85..150
        puts "Today, it's #{temperature} degrees and sunny!"
    when 60..84
        puts "Today, it's #{temperature} degrees and crazy cloudy!"
    when 55..59
        puts "Today, it's #{temperature} degrees and crazy rainy!"
    when 32..54
        puts "Today, it's #{temperature} degrees and super snowy!"
    else
        puts "Sorry! We don't have weather info for #{place}"
    end
    #puts "Tomorrow's weather: " + weather.tomorrow.high.f
#=begin    
    #puts 
    #puts "Weather.Current: " + weather.current.to_s
    forecast_hash = weather.forecast
    forecast_hash.each do |forecast|
        d = DateTime.new(forecast.starts_at.year,
                         forecast.starts_at.month,
                         forecast.starts_at.day)        
        #t = Date.today + 1              #finds out tomorrows date
        #tomorrow = t.strftime("%w")
        t = Date.today      #finds out today's date
        today = t.strftime("%w")
        tomorrow = today.to_i + 1
        #puts "Today's num value: " + today.to_s
        day = d.strftime("%w")
        #puts "Day: #{day}"
        day_of_week = ""
        if day.to_i == today.to_i
            day_of_week = "Today"
        elsif day.to_i == tomorrow
            day_of_week = "Tomorrow"
        else
            case day.to_i            
                when 0 
                    day_of_week = "Sunday"
                when 1 
                    day_of_week = "Monday"
                when 2 
                    day_of_week = "Tuesday"
                when 3 
                    day_of_week = "Wednesday"
                when 4 
                    day_of_week = "Thursday"
                when 5 
                    day_of_week = "Friday"
                when 6 
                    day_of_week = "Saturday"
            end #ending case when block
        end # ending if/else block
            
        #puts forecast.starts_at.month.to_s + '/' + forecast.starts_at.day.to_s + ' is going to be ' + forecast.icon + ' with a low of ' + forecast.low.f.to_s + ' and a high of ' + forecast.high.f.to_s
        puts day_of_week + ' is going to be ' + forecast.icon + ' with a low of ' + forecast.low.f.to_s + ' and a high of ' + forecast.high.f.to_s

    end
#=end

end
weather_condition(location)
#Barometer::WeatherService.register(:forecast_io, Barometer::ForecastIo)
=begin
#https://github.com/tzinfo/tzinfo/wiki/Resolving-TZInfo::DataSourceNotFound-Errors
barometer = Barometer.new('Paris')
weather = barometer.measure

puts weather.current.temperature
=end