

class Weather::Cli

    def call
        greeting_user
    end

    def weather_by_state(state_name)
        state_name = state_name.gsub(/  */, " ")
        state_name = state_name.gsub(/ /, "%20")
        state_current_weather = Weather::CurrentWheater.new(state_name).get_weather_by_state
        getting_weather_coord(state_current_weather)
    end

    def weather_by_zip_code(zip_code)
        zip_code_current_weather = Weather::CurrentWheater.new(nil, zip_code).get_weather_by_zip_code
        getting_weather_coord(zip_code_current_weather)
    end

    def getting_weather_coord(current_weather)
        @input_1
        if current_weather["name"].class == NilClass
            puts ""
            if @input_1 == "by state"
                puts "Please enter a valid state name"
                get_state_name
            elsif @input_1 == "by zipcode"
                puts "Please enter a valid zipcode"
                get_zip_code
            end
        else
            puts ""
            puts "Current weather for #{current_weather["name"]}, #{current_weather["sys"]["country"]}, timezone  #{current_weather["timezone"].to_s}"
            print "lon: " + current_weather["coord"]["lon"].to_s + "  "
            puts "lat: " + current_weather["coord"]["lat"].to_s
            getting_weather_condition(current_weather)  
        end
    end

    def getting_weather_condition(current_weather)
        puts "description: #{current_weather["weather"][0]["description"]}"
        puts "Current temperature: #{current_weather["main"]["temp"].to_s}f°"
        print "Temperature max: #{current_weather["main"]["temp_max"].to_s}f°, "
        puts "temperature min: #{current_weather["main"]["temp_min"].to_s}f°, "
        puts "Feels like: #{current_weather["main"]["feels_like"].to_s}f°"
        puts "Humidity: #{current_weather["main"]["humidity"].to_s}"
        puts "Wind speed: #{current_weather["wind"]["speed"]} mph"
        puts ""
    end

    def get_state_name
        puts "Enter your state name"
        input_2 = gets.chomp 
        weather_by_state(input_2)
    end

    def get_zip_code
        puts "Enter zipcode"
        input_2 = gets.chomp 
        weather_by_zip_code(input_2)
    end

    def greeting_user

        @input_1 = nil
        zip_code = @input_1 != "by zipcode"
        exit_value = @input_1 != "exit"

        while @input_1 != "by state" || zip_code || exit_value
            puts ""
            puts "Hello dear user"
            puts "This program give you information about the current weather in the US"
            puts "for weather in your state enter 'by state' " 
            puts "for weather by your zipcode enter 'by zipcode' "
            puts "Enter your query here"
    
            @input_1 = gets.chomp
        
            case @input_1
            when 
                "by state"
                get_state_name
                break
            when 
                "by zipcode"
                get_zip_code
                break
            when
                "exit"
                break
            else
                puts ""
                puts "Please enter a valid query "
                puts ""
            end
        end
    end
end





#*****CURRENT WEATHER************

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