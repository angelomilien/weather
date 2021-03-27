

class Weather::Cli

    def call
        greeting_user
    end

    # STATE SECTION

    def get_state_name_from_user                                         
        puts "Enter your state name"
        input_2 = gets.chomp 
        display_weather(Weather::CurrentWeather.find_or_create_by_state_name(input_2))
    end
    
    # ZIP CODE SECTION

    def get_zip_code_from_user
        puts "Enter zipcode"
        input_2 = gets.chomp 
        display_weather(Weather::CurrentWeather.find_or_create_by_zip_code(input_2))
    end

    # ZIPCODE AND STATE COMMON FUNCTIONS
    
    def display_weather(current_weather) 
        if current_weather.message == "yes"         
           puts ""
           puts "Hello the current weather for " + current_weather.location_name + " is:"
           puts "Temperature: " + current_weather.temperature + ", " + current_weather.description + ", feels like: " + current_weather.feels_like
           puts "Temp max: " + current_weather.temp_max + ", Temp min: " + current_weather.temp_min
           puts "Lon: " + current_weather.lon + ", Lat: " + current_weather.lat
           puts "Wind speed: " + current_weather.wind_speed
           puts "Humidity: " + current_weather.humidity
           puts "Pressure: " + current_weather.pressure
           puts ""
        else
           puts current_weather.message
           puts "" 
        end
    end

    def greeting_user

        @input_1 = nil
        zip_code = @input_1 != "by zipcode"
        exit_value = @input_1 != "exit"

        while @input_1 != "by state" || zip_code || exit_value
            puts "Hello dear user"
            puts "This program give you information about the current weather in the US"
            puts "for weather in your state enter 'by state' " 
            puts "for weather by your zipcode enter 'by zipcode' "
            puts "to exit the program enter 'exit'"
            puts "Enter your query below"
    
            @input_1 = gets.chomp
        
            case @input_1
            when 
                "by state"
                get_state_name_from_user
            when 
                "by zipcode"
                get_zip_code_from_user
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

