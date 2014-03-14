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
					Course.create!(	subject: subject,
													number: number,
													section: section)
				end
			end
		end

		# generate sample books
		Book.destroy_all
		500.times do |book|
			title = 		Faker::Commerce.product_name
			author = 		Faker::Name.name
			publisher =	Faker::Company.name
			edition = 	["01", "02", "03", "04", "05"].sample
			price = 		rand(5.00..199.99).round(2).to_f
			required = 	["Required", "Referenced", "Recommended", "Alternate"].sample
			image =			"http://placehold.it/80x80"
			location = Location.create!(x: rand(0.0..100.0),
																	y: rand(0.0..100.0),
																	floor: rand(1..2),
																	subject: ["Mathematics", "Business", "History", "Science", "Engineering", "Computer Science", "Korean"].sample,
																	section: rand(1..30));
			Book.create!(	title: title,
										author: author,
										publisher: publisher,
										edition: edition,
										price: price,
										required: required,
										image: image,
										location: location);
		end

		# assign books to courses randomly.
		Course.all.each do |course|
			num_books = rand(0..4)
			for i in 1..num_books
				book_id = rand(Book.first.id..Book.last.id)
				course.books.push(Book.find(book_id))
			end
		end
	end
end
