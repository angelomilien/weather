

class Weather::Cli


    def call
        greeting_user
    end

    def weather_by_state_call(state_name)
        state_name = state_name.gsub(/  */, " ")
        state_name = state_name.gsub(/ /, "%20")
        current_weather_1 = Weather::CurrentWheater.new(state_name).get_weather_by_state
        getting_weather_coord(current_weather_1)
    end

    def getting_weather_coord(current_weather)
        puts ""
        print "lon: " + current_weather["coord"]["lon"].to_s + "  "
        puts "lat: " + current_weather["coord"]["lat"].to_s
        getting_weather_condition(current_weather)
    end

    def getting_weather_condition(current_weather)
        puts current_weather["weather"]["description"]
    end

    def greeting_user

        input_1 = nil
        zip_code = input_1 != "by zipcode"
        city = input_1 != "by city" 

        while input_1 != "by state" || city || zip_code || "exit"
            puts "Hello dear user"
            puts "This program give you information about the current weather in the US"
            puts "for weather in your state enter 'by state'" 
            puts "for weather in your city enter  'by city'"
            puts "for weather by your zipcode enter 'by zipcode'"
            puts "Enter your query here"
    
            input_1 = gets.chomp
            
            case input_1
            when 
                "by state"
                puts "Enter state name"
                input_2 = gets.chomp 
                self.weather_by_state_call(input_2)
                break
            when 
                "by city"
                puts "by city present"
            when
                "by zipcode"
                puts "by zipcode present"
            when
                "exit"
                break
            else
                puts "Please enter a valid input "
                puts ""
            end
        end
    end
end


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