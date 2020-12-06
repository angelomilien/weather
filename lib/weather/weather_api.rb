
puts "now reading weather_api.rb"


class Weather::CurrentWheater
    
    attr_reader :state, :city, :zipcode

    def initialize(state=nil, city=nil, zip_code=nil)
       @state = state 
       @city = city
       @zip_code = zip_code
       @endpoint = "http://api.openweathermap.org/data/2.5/weather?"
       @id = "eb2960bbde17c4dabead26c81e99150a"
    end

    def get_weather_by_state
        weather_by_state = HTTParty.get("#{@endpoint}q=#{@state},us&appid=#{@id}&units=imperial")
    end

    def get_weather_by_city_and_state
        weather_by_city_and_state = HTTParty.get("#{@endpoint}q=Hempstead,New%York&appid=#{@id}&units=imperial")
    end

    def get_weather_by_zip_code
        weather_by_zip_code = HTTParty.get("#{@endpoint}q=11706,us&appid=#{@id}&units=imperial")
    end

end