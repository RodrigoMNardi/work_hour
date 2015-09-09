class Day < ActiveRecord::Base
  belongs_to :calender

  has_many :work_days
end
