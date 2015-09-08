class Calender < ActiveRecord::Base
  has_many :days, :dependent => :destroy
end
