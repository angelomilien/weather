

class Wheather::Cli


    def call
        greeting_user
    end

    def greeting_user
        
        input = nil
        # while input != "exit"
        puts "Hello dear user"
        puts "This program give you information about the current wheather in the US"
        puts "for wheather in your city enter your 'Zip Code', or 'city name'" 
        puts "for wheather in your state enter your 'state'"
        puts "Enter your query here"

        input = gets.chomp
        
        if input != "exit"
          puts "hfks"
        end
        # end
    end
end