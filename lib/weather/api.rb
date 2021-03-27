
class Weather::Api

    def get_state_current_weather_data(state_name)
        weather_by_state = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{state_name},us&appid=#{ENV["API_KEY"]}&units=imperial")
    end

    def get_current_weather_by_zip_code(zip_code)
        weather_by_zip_code = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=#{zip_code}&appid=#{ENV["API_KEY"]}&units=imperial") 
        
    end
end
