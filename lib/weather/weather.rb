


class Weather::CurrentWeather
   
   attr_accessor :lon, :lat, :temperature, :temp_max, :temp_min, :humidity, :pressure, :description, :feels_like, :wind_speed, :zip_code, :location_name, :location, :message
   
   @@all = []

   def self.all
      @@all
   end

   def save
      self.class.all << self
   end

   # Shared method for state and zipcode entry

   def self.validate_weather_data(weather_data, entry)
      if weather_data["cod"] == 200
         @current_weather.set_up_properties(weather_data, entry)
      elsif weather_data["cod"] == "404"
        @current_weather.message = " \nYou probably had a wrong entry please try again!"
      else
         @current_weather.message = "\nSorry something wrent wrong"
      end
   end

   def set_up_properties(weather_data, entry)
      self.location = entry.gsub(/%20/, " ")
      self.message = "yes"
      self.lon = weather_data["coord"]["lon"].to_s 
      self.lat = weather_data["coord"]["lat"].to_s
      self.temperature = weather_data["main"]["temp"].to_s
      self.temp_max = weather_data["main"]["temp_max"].to_s + "f°"
      self.temp_min = weather_data["main"]["temp_min"].to_s + "f°"      
      self.humidity = weather_data["main"]["humidity"].to_s
      self.pressure = weather_data["main"]["pressure"].to_s
      self.description = weather_data["weather"][0]["description"]
      self.feels_like = weather_data["main"]["feels_like"].to_s + "f°" 
      self.wind_speed = weather_data["wind"]["speed"].to_s  + "mph"
      self.location_name = weather_data["name"]
      self.save
   end

   def self.find_by_location(location)
      self.all.find {|weather| weather.location == location}
   end


   # State methods section


   def self.find_or_create_by_state_name(state_name)
      if self.all.include?(self.find_by_location(state_name)) == false                           
         added_20_percent_to_state_name = state_name.gsub(/  */, " ").gsub(/ /, "%20")
         self.create_by_state_name(added_20_percent_to_state_name)
      else
         self.find_by_location(state_name)
      end
   end

   def self.create_by_state_name(state_name)
      @current_weather = self.new
      weather_data = Weather::Api.new.get_state_current_weather_data(state_name)     # contribution with Api class
      validate_weather_data(weather_data, state_name)
      @current_weather
   end


   # Zipcode section

   def self.find_or_create_by_zip_code(zip_code)
      if self.all.include?(self.find_by_location(zip_code)) == false
         self.create_by_zip_code(zip_code)
      else
         self.find_by_location(zip_code)
      end
   end

   def self.create_by_zip_code(zip_code)
      @current_weather = self.new
      weather_data = Weather::Api.new.get_current_weather_by_zip_code(zip_code)     # contribution with Api class
      validate_weather_data(weather_data, zip_code)
      @current_weather
   end
end



# ****CURRENT WEATHER************

# {"coord"=>{"lon"=>-74.5, "lat"=>40.17},
#  "weather"=>
#   [{"id"=>803,
#     "main"=>"Clouds",
#     "description"=>"broken clouds",
#     "icon"=>"04d"}],
#  "base"=>"stations",
#  "main"=>
#   {"temp"=>37.99,
#    "feels_like"=>21.61,
#    "temp_min"=>36,
#    "temp_max"=>39.99,
#    "pressure"=>1011,
#    "humidity"=>55},
#  "visibility"=>10000,
#  "wind"=>{"speed"=>20.8, "deg"=>290, "gust"=>26.4},
#  "clouds"=>{"all"=>75},
#  "dt"=>1607269353,
#  "sys"=>
#   {"type"=>1,
#    "id"=>5065,
#    "country"=>"US",
#    "sunrise"=>1607256395,
#    "sunset"=>1607290338},
#  "timezone"=>-18000,
#  "id"=>5101760,
#  "name"=>"New Jersey",
#  "cod"=>200}


    #     print "lon: " + self.interface["coord"]["lon"].to_s + "  "
    #     print "lat: " + self.interface["coord"]["lat"].to_s

 
    #     puts "Current temperature: #{self.interface["main"]["temp"].to_s}f°"
    #     puts "Temperature max: #{self.interface["main"]["temp_max"].to_s}f°"
    #     puts "Temperature min: #{self.interface["main"]["temp_min"].to_s}f°"
    #     puts "Feels like: #{self.interface["main"]["feels_like"].to_s}f°"
    #     puts "Humidity: #{self.interface["main"]["humidity"].to_s}"
    #     puts "Wind speed: #{self.interface["wind"]["speed"]} mph"
  

      #     print "lon: " + self.interface["coord"]["lon"].to_s + "  "
      #     print "lat: " + self.interface["coord"]["lat"].to_s
      # end



