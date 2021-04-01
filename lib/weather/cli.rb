

class Weather::Cli

    def call
        greeting_user
    end

    # STATE SECTION

    def get_state_name_from_user                                         
        puts "Enter your state name"
        input_3 = gets.strip 
        Weather::CurrentWeather.find_or_create_by_state_name(input_3)
    end
    
    # ZIP CODE SECTION

    def get_zip_code_from_user
        puts "Enter your zipcode"
        input_3 = gets.strip 
        Weather::CurrentWeather.find_or_create_by_zip_code(input_3)
    end

    # ZIPCODE AND STATE COMMON FUNCTIONS
    
    def display_weather(current_weather)          
           puts ""
           puts "the current weather for " + current_weather.location_name + " is:"
           puts "Temperature: " + current_weather.temperature + ", " + current_weather.description + ", feels like: " + current_weather.feels_like
           puts "Temp max: " + current_weather.temp_max + ", Temp min: " + current_weather.temp_min
           puts "Lon: " + current_weather.lon + ", Lat: " + current_weather.lat
           puts "Wind speed: " + current_weather.wind_speed
           puts "Humidity: " + current_weather.humidity
           puts "Pressure: " + current_weather.pressure
           puts ""
    end

    def first_display(current_weather)
        puts ""
        puts "the current weather for " + current_weather.location_name + " is:"
        puts "Temperature: " + current_weather.temperature + ", " + current_weather.description + ", feels like: " + current_weather.feels_like
        puts "Temp max: " + current_weather.temp_max + ", Temp min: " + current_weather.temp_min
        puts ""
        puts "do you need more information about the weather?"
        puts "You can say 'yes/y' or 'no/n'"
    end

    def terminate_program_on_fourth_deep_layer
        @third_nested = false
        @second_nested = false
        @first_nested = false
        @main_while_is = false
    end

    def get_fourth_nested(current_weather)
        case current_weather.message # if weather is found or created it's message will be yes 
            when "yes"
                first_display(current_weather)

                while @fourth_nested
                    input_4 = gets.strip
                    case input_4.upcase
                        when "YES", "Y"
                           display_weather(current_weather)
                           puts "program is terminated thank you!"
                           terminate_program_on_fourth_deep_layer  # will continue with more code after
                           break
                        when "NO","N"
                           puts "program is terminated thank you!"
                           terminate_program_on_fourth_deep_layer
                           break
                        else
                           puts ""
                           puts "Wrong input please try again"
                    end
                end
            else
                puts current_weather.message #You entered a wrong entry please try again!
        end
    end

    def greeting_user

        @main_while_is = true
        @first_nested = false
        @second_nested = true
        @third_nested = true
        @fourth_nested = true

        while @main_while_is
            
            while @first_nested == false
                puts ""
                puts "Hello would you like to know the weather on your city or your state?"
                puts "you can enter 'yes/y' or 'no/n' to close the program:"
                @first_nested = true
            end

            while @first_nested
                input_1 = gets.strip
                case input_1.upcase
                    # when user enter yes this block code below will execute.
                    when "YES", "Y"
                        puts "for state enter 'state/s' and 'zipcode/z' for zipcode"
                        while @second_nested
                            input_2 = gets.strip
                            case input_2.downcase
                                when "state","s"

                                    while @third_nested
                                        current_weather = get_state_name_from_user
                                        get_fourth_nested(current_weather)        
                                    end
                                when "zipcode","z" 
                                   
                                    while @third_nested
                                        current_weather = get_zip_code_from_user
                                        get_fourth_nested(current_weather)
                                    end
                                else
                                    puts ""
                                    puts "Please enter a valid input"
                            end
                        end
            
                    when "NO","N" 
                        puts "program is terminated thank you!"
                        @main_while_is = false
                        break
                    else
                        puts ""
                        puts "Please enter a valid input"
                end
            end
        end
    end
end

# my Notes

# description = case 16
# when 13..19 then "teenager"
# else ""
# end


