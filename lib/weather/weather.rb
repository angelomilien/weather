


class Weather::CurrentWeather
   
    attr_reader :interface 

    def initialize(interface=nil)
        @interface = interface
    end

    def description
        print "Description: #{self.interface["weather"][0]["description"]}"
    end

    def present_current_weather
        puts ""
        puts "Current weather for: #{self.interface["name"]}, #{self.interface["sys"]["country"]}, timezone:  #{self.interface["timezone"].to_s}" 
    end

    def coordinate
        print "lon: " + self.interface["coord"]["lon"].to_s + "  "
        print "lat: " + self.interface["coord"]["lat"].to_s
    end

    def condition
        puts "Current temperature: #{self.interface["main"]["temp"].to_s}f°"
        puts "Temperature max: #{self.interface["main"]["temp_max"].to_s}f°"
        puts "Temperature min: #{self.interface["main"]["temp_min"].to_s}f°"
        puts "Feels like: #{self.interface["main"]["feels_like"].to_s}f°"
        puts "Humidity: #{self.interface["main"]["humidity"].to_s}"
        puts "Wind speed: #{self.interface["wind"]["speed"]} mph"
    end

    def code
        self.interface["code"]
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



