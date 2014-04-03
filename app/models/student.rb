class Student < ActiveRecord::Base
	validates :id, uniqueness: true
	validates :user_id, uniqueness: true
	has_and_belongs_to_many :courses
end
