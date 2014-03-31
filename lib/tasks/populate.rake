namespace :db do
	desc "Erase and fill database"
	# Helper function for generating shelves	
	# floor is int, the floor number
	# section is array of int, the section numbers to generate
	#					section numbers have the same number of shelves
	def createShelves(floor, section, number_of_shelves)
		subject = [	"Aboriginal Studies", "Astronomy", "Biology", "Chemistry", "Computer Science", "Economics",
								"Engineering", "Environment", "Mathematics", "Physics", "Psychology", "Sociology",
								"Art", "English", "Philosophy"]
		section.each do |s|
			number_of_shelves.times do |shelf|
				Shelf.create!(floor: floor.to_s(),
											subject: subject.sample,
											section: s.to_s(),
											shelf_number: shelf.to_s())
			end
		end
	end

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

		# generate shelves mannually OR... NOT?
		Shelf.delete_all

		# Floor 1
		floor = 1
		section = [1, 2, 4, 5, 6, 7]	# 7 shelves group
		createShelves(floor, section, 7)
		section = [3, 8, 9, 10]	# 5 shelves group
		createShelves(floor, section, 5)
		section = [11..17]	# 3 shelves group
		createShelves(floor, section, 3)
		# Floor 2
		floor = 2
		section = [19, 25, 27]	# 10 shelves group
		createShelves(floor, section, 10)
		section = [22, 26]	# 9 shelves group
		createShelves(floor, section, 9)
		# individual groups
		section = [18]
		createShelves(floor, section, 5)
		section = [20]
		createShelves(floor, section, 23)
		section = [21]
		createShelves(floor, section, 18)
		section = [23]
		createShelves(floor, section, 11)
		section = [24]
		createShelves(floor, section, 16)

		# generate sample books
		Book.delete_all
		500.times do |book|
			title = 		Faker::Commerce.product_name
			author = 		Faker::Name.name
			publisher =	Faker::Company.name
			edition = 	["01", "02", "03", "04", "05"].sample
			price = 		rand(5.00..199.99).round(2).to_f
			required = 	["Required", "Referenced", "Recommended", "Alternate"].sample
			image =			"http://placehold.it/80x80"
			shelf_id = rand(Shelf.first.id..Shelf.last.id)
			Book.create!(	title: title,
										author: author,
										publisher: publisher,
										edition: edition,
										price: price,
										required: required,
										image: image,
										shelf: Shelf.find(shelf_id))
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
