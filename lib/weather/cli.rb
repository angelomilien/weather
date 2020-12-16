

class Weather::Cli

    def call
        greeting_user
    end

      # STATE SECTION
    def get_state_name_from_user
        puts "Enter your state name"
        input_2 = gets.chomp 
        parse_state_name(input_2)
    end

    def create_api_from_state_name(state_name)
        Weather::Api.new(state_name)
    end

    def get_weather_by_state(state_parsed_name)
        api = create_api_from_state_name(state_parsed_name)
        state_current_weather = Weather::CurrentWeather.new(api.get_state_api_interface)
        validate_weather_interface(state_current_weather)
    end
    
    def parse_state_name(state_name)
        result = state_name.gsub(/  */, " ").gsub(/ /, "%20")
        get_weather_by_state(result)
    end

    # ZIP CODE SECTION

    def get_zip_code_from_user
        puts "Enter zipcode"
        input_2 = gets.chomp 
        weather_by_zip_code(input_2)
    end

    def weather_by_zip_code(zip_code)
        api = create_api_from_zip_code(zip_code)
        zip_code_current_weather = Weather::CurrentWeather.new(api.get_zip_code_api_interface)
        validate_weather_interface(zip_code_current_weather)
    end
     
    def create_api_from_zip_code(zip_code)
        Weather::Api.new(nil, zip_code)
    end

    # ZIPCODE AND STATE COMMON FUNCTIONS
    def validate_weather_interface(current_weather)
        @input_1
        if current_weather.interface.code == 404
            puts ""
            if @input_1 == "by state"
                puts "Please enter a valid state name"
                get_state_name_from_user
            elsif @input_1 == "by zipcode"
                puts "Please enter a valid zipcode"
                get_zip_code_from_user
            end
        else
            print_weather_condition(current_weather)
        end

    end

    def print_weather_condition(weather)
        puts weather.present_current_weather
        puts weather.coordinate
        puts weather.description
        puts weather.condition
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
