class WeeklyPlan < ApplicationRecord
    serialize :data, Array
    def sunday_of_cweek(year=Date.today.year)
        # Find the first day of the commercial week which is Monday
        monday = Date.commercial(year, week_number, 1)
        
        # Calculate the date of the Sunday, which is the 7th day of the commercial week
        sunday = monday - 1
        
        return sunday
      end
      
end
