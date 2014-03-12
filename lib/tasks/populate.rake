namespace :db do
	desc "Erase and fill database"
	task :populate => :environment do
		require 'populator'
		require 'faker'
		
		# sample data (uWaterloo's courses)
		subjects = ["MATH", "CS", "ECON", "BUS", "AFM", "ENGL", 
								"STAT", "CO", "PHYS", "ECE", "CHEM", "BIO", "COMM", "KOR"]
		numbers = [101, 102, 250, 260, 345, 346, 460, 480]
		sections = ["01", "02", "03"]
		
		# generate sample courses
		Course.delete_all	# erase first
		subjects.each do |subject|
			numbers.each do |number|
				sections.each do |section|
					Course.create!(subject: subject,
													number: number,
													section: section)
				end
			end
		end
	end
end
