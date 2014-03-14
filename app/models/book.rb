class Book < ActiveRecord::Base
	has_and_belongs_to_many :courses
	has_one :location, :dependent => :destroy
end
