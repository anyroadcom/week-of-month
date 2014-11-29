module WeekOfMonth
  module WeekNoRails
    # it returns date of the first day(sunday) of the week
    # Date.new(2012,11,15).beginning_of_week
    #   => #<Date: 2012-11-12 ((2456244j,0s,0n),+0s,2299161j)>
    # Time.new(2012,11,30).beginning_of_week
    #   => 2012-11-29 23:59:55 +0530
    # @return [Date || Time]
    def beginning_of_week
      self.class.new(year,month,current_week.detect {|i| !i.nil?})
    end

    # it returns date of the last day(saturday) of the week
    # Date.new(2012,11,15).end_of_week
    #   => #<Date: 2012-11-19 ((2456251j,0s,0n),+0s,2299161j)>
    # Time.new(2012,11,30).end_of_week
    #   => 2012-11-30 00:00:02 +0530
    # @return [Date || Time]
    def end_of_week
      if current_week.index(self.day) == 6
        self.class.new(year,month,current_week.last)
      elsif current_week.index(self.day) < 6
        if self.class == Date
          self +  (6 -  current_week.index(self.day))
        elsif self.class == Time
          self +  (60 * 60 * 24  * (6 -  current_week.index(self.day)))
        end
      end
    end

    # it returns date of the next week day.
    # Date.new(2012,11,15).next_week
    #   => #<Date: 2012-11-22 ((2456254j,0s,0n),+0s,2299161j)>
    # Time.new(2012,11,30).next_week
    #   => 2012-11-30 00:00:07 +0530
    # @return [Date || Time]
    def next_week
      if self.class == Date
        self + 7
      elsif self.class == Time
        self + (60 * 60 * 24 * 7)
      end
    end

    # it returns date of the previous week day.
    # Date.new(2012,11,15).previous_week
    #   => #<Date: 2012-11-08 ((2456240j,0s,0n),+0s,2299161j)>
    # Time.new(2012,11,30).previous_week
    #   => 2012-11-29 23:59:53 +0530
    # @return [Date || Time]
    def previous_week
      if self.class == Date
        self - 7
      elsif self.class == Time
        self - (60 * 60 * 24 * 7)
      end
    end
  end
end
