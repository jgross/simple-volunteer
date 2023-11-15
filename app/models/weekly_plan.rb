class WeeklyPlan < ApplicationRecord
  belongs_to :org, optional: true
    serialize :data, Array
    serialize :shift_data, JSON
    def sunday_of_cweek(year=Date.today.year)
        # Find the first day of the commercial week which is Monday
        monday = Date.commercial(year, week_number, 1)
        
        # Calculate the date of the Sunday, which is the 7th day of the commercial week
        sunday = monday - 1
        
        return sunday
      end


    
      def first_shift_time
        self.shift_data ||={}
        self.shift_data["first"] ||= {}
        self.shift_data["first"]["time"] ||= '08:00-12:00'
        self.shift_data["first"]["time"]
      end        

      def first_shift_time=(time)
        self.shift_data ||={}
        self.shift_data["first"] ||= {}
        self.shift_data["first"]["time"] = time
        self.shift_data["first"]["time"]
      end

      def first_shift_manager
        self.shift_data ||={}
        self.shift_data["first"] ||= {}
        self.shift_data["first"]["manager"] ||= true 
      end 

      def first_shift_manager=(need_a_manager)
        self.shift_data ||={}
        self.shift_data["first"] ||= {}
        self.shift_data["first"]["manager"] = need_a_manager == "1"
      end 

      def second_shift_manager
        self.shift_data ||={}
        self.shift_data["second"] ||= {}
        self.shift_data["second"]["manager"] ||= false 
      end 

      def second_shift_manager=(need_a_manager)
        self.shift_data ||={}
        self.shift_data["second"] ||= {}
        self.shift_data["second"]["manager"] = need_a_manager == "1"
      end 

      

      def first_shift_number_of_volunteers
        self.shift_data ||= {}
        self.shift_data["first"] ||= {}
        self.shift_data["first"]["number_of_volunteers"] ||= 10
        self.shift_data["first"]["number_of_volunteers"].to_i
      end 

      def first_shift_number_of_volunteers=(num)
        self.shift_data ||={}
        self.shift_data["first"] ||= {}
        self.shift_data["first"]["number_of_volunteers"] = num 
      end 

      def second_shift_time
        self.shift_data ||={}
        self.shift_data["second"] ||= {}
        self.shift_data["second"]["time"] ||= '13:00-17:00'
        self.shift_data["second"]["time"]
      end

      def second_shift_time=(time)
        self.shift_data ||={}
        self.shift_data["second"] ||= {}
        self.shift_data["second"]["time"] = time
        self.shift_data["second"]["time"]
      end

      def second_shift_number_of_volunteers
        self.shift_data ||={}
        self.shift_data["second"] ||= {}
        self.shift_data["second"]["number_of_volunteers"] ||= 6
        self.shift_data["second"]["number_of_volunteers"].to_i
      end

      def second_shift_number_of_volunteers=(num)
        self.shift_data ||={}
        self.shift_data["second"] ||= {}
        self.shift_data["second"]["number_of_volunteers"] = num
      end

      
end
