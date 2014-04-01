namespace :db do
	desc "Erase and fill database"

	# Helper function to map a shelf to a x,y coordinates
	# section , shelf_number are valid
	# return a array in [x, y] format
	#	ex) [10.22,32.2]
	def mapShelf(section, shelf_number)
		# ret vals
		floor01_hori = 8.4
		floor01_vert = 8
		x = 0
		y = 0
		case section
		# Start of Floor 1
		when 1
			x = 12.2 + (shelf_number * floor01_hori)
			y = 73.8
		when 2
			x = 12.2 + (shelf_number * floor01_hori)
			y = 69.8
		when 3
			x = ((2..4).include?(shelf_number))? 12.2 + ((shelf_number+1) * floor01_hori) : 12.2 + (shelf_number * floor01_hori)
			y = 57.8
		when 4
			x = 12.2 + (shelf_number * floor01_hori)
			y = 53.8
		when 5
			x = 12.2 + (shelf_number * floor01_hori)
			y = 42.8
		when 6
			x = 12.2 + (shelf_number * floor01_hori)
			y = 38.8
		when 7
			x = 12.2 + (shelf_number * floor01_hori)
			y = 26.8
		when 8
			x = ((2..4).include?(shelf_number))? 12.2 + ((shelf_number+1) * floor01_hori) : 12.2 + (shelf_number * floor01_hori)
			y = 22.8
		when 9
			x = 12.2 + (shelf_number * floor01_hori)
			y = 11.8
		when 10
			x = 12.2 + (shelf_number * floor01_hori)
			y = 7.8
		when 11
			x = 41.2 + (shelf_number * floor01_hori)
			y = 83.8
		when 12
			x = 41.2 + (shelf_number * floor01_hori)
			y = 6.2
		when 13
			x = -0.5
			y = 60.8 + (shelf_number * floor01_vert)
		when 14
			x = -0.5
			y = 32.8 + (shelf_number * floor01_vert)
		when 15
			x = -0.5
			y = 3.8 + (shelf_number * floor01_vert)
		when 16
			x = 6.2 + (shelf_number * floor01_hori)
			y = -4.2
		when 17
			x = 41.2 + (shelf_number * floor01_hori)
			y = -4.2
		# Start of Floor 2
		when 18
			case shelf_number
			when 0
				x = 1.1
				y = 36.6
			when 1
				x = 1.1
				y = 42.6
			when 2
				x = 2.2
				y = 48.6
			when 3
				x = 7.6
				y = 46.8
			when 4
				x = 7.6
				y = 40.8
			end
		when 19
			x = 9.3 + (shelf_number * 2.7)
			y = 35.2
		when 20
			case shelf_number
			when 0
				x = 32.7
				y = 26.8
			when 1
				x = 33.4
				y = 20.8
			when 2
				x = 33.4
				y = 11.8
			when 3
				x = 33.4
				y = 2.8
			when 4
				x = 35.2
				y = -4.2
			when 5
				x = 37.8
				y = -4.2
			when 6
				x = 40.4
				y = -4.2
			when 7
				x = 42.3
				y = -4.2
			when 8
				x = 44.2
				y = -4.2
			when 9
				x = 46.8
				y = -4.2
			when 10
				x = 48.6
				y = 1.8
			when 11
				x = 48.6
				y = 11.8
			when 12
				x = 48.6
				y = 20.8
			when 13
				x = 43.9
				y = 17.8
			when 14
				x = 42.8
				y = 17.8
			when 15
				x = 39.2
				y = 17.8
			when 16
				x = 38.2
				y = 17.8
			when 17
				x = 38.2
				y = 11.8
			when 18
				x = 39.2
				y = 11.8
			when 19
				x = 42.8
				y = 11.8
			when 20
				x = 43.9
				y = 11.8
			when 21
				x = 43.3
				y = 5.8
			when 22
				x = 38.6
				y = 5.8
			end
		when 21
			offset = 16.6
			case shelf_number
			when 0
				x = 32.7 + offset
				y = 26.8
			when 1
				x = 33.4 + offset
				y = 20.8
			when 2
				x = 33.4 + offset
				y = 11.8
			when 3
				x = 33.4 + offset
				y = 2.8
			when 4
				x = 35.2 + offset
				y = -4.2
			when 5
				x = 37.8 + offset
				y = -4.2
			when 6
				x = 40.4 + offset
				y = -4.2
			when 7
				x = 42.3 + offset
				y = -4.2
			when 8
				x = 43.9
				y = 17.8
			when 9
				x = 42.8
				y = 17.8
			when 10
				x = 39.2
				y = 17.8
			when 11
				x = 38.2
				y = 17.8
			when 12
				x = 38.2
				y = 11.8
			when 13
				x = 39.2
				y = 11.8
			when 14
				x = 42.8
				y = 11.8
			when 15
				x = 43.9
				y = 11.8
			when 16
				x = 43.3
				y = 5.8
			when 17
				x = 38.6
				y = 5.8
			end
		when 22
			offset_near = 16.6
			offset_far = 33.1
			case shelf_number
			when 0
				x = 44.2 + offset_near
				y = -4.2
			when 1
				x = 46.8 + offset_near
				y = -4.2
			when 2
				x = 48.6 + offset_near
				y = 1.8
			when 3
				x = 48.6 + offset_near
				y = 11.8
			when 4
				x = 48.6 + offset_near
				y = 20.8
			when 5
				x = 32.7 + offset_far
				y = 26.8
			when 6
				x = 33.4 + offset_far
				y = 20.8
			when 7
				x = 33.4 + offset_far
				y = 11.8
			when 8
				x = 33.4 + offset_far
				y = 2.8
			end
		when 23
			x = 49.9 + (shelf_number * 2.7)
			y = 35.2
		when 24
			offset = 33.1
			case shelf_number
			when 0
				x = 35.2 + offset
				y = -4.2
			when 1
				x = 37.8 + offset
				y = -4.2
			when 2
				x = 40.4 + offset
				y = -4.2
			when 3
				x = 42.3 + offset
				y = -4.2
			when 4
				x = 44.2 + offset
				y = -4.2
			when 5
				x = 46.8 + offset
				y = -4.2
			when 6
				x = 43.9 + offset
				y = 17.8
			when 7
				x = 42.8 + offset
				y = 17.8
			when 8
				x = 39.2 + offset
				y = 17.8
			when 9
				x = 38.2 + offset
				y = 17.8
			when 10
				x = 38.2 + offset
				y = 11.8
			when 11
				x = 39.2 + offset
				y = 11.8
			when 12
				x = 42.8 + offset
				y = 11.8
			when 13
				x = 43.9 + offset
				y = 11.8
			when 14
				x = 43.3 + offset
				y = 5.8
			when 15
				x = 38.6 + offset
				y = 5.8
			end
		when 25
			case shelf_number
			when 0..3
				x = 49.9 + (shelf_number * 2.7)
				y = 35.2
			when 4
				x = 88.1
				y = 29.8
			when 5
				x = 88.1
				y = 23.8
			when 6
				x = 85.4
				y = 22.4
			when 7
				x = 83.1
				y = 22.4
			when 8
				x = 82.5
				y = 17.4
			when 9
				x = 82.5
				y = 10.4
			end
		when 26
			case shelf_number
			when 0
				x = 83
				y = 5.8
			when 1
				x = 85.1
				y = 5.8
			when 2
				x = 87.1
				y = 5.8
			when 3
				x = 89.1
				y = 5.8
			when 4
				x = 90.6
				y = 5.8
			when 5
				x = 92.1
				y = 7.4
			when 6
				x = 92.8
				y = 15.4
			when 7
				x = 92.8
				y = 23.4
			when 8
				x = 92.8
				y = 33.4
			end
		when 27
			case shelf_number
			when 0
				x = 83.8
				y = -4.4
			when 1
				x = 86.5
				y = -4.4
			when 2
				x = 89
				y = -4.4
			when 3
				x = 90.9
				y = -4.4
			when 4
				x = 92.7
				y = -4.4
			when 5
				x = 95.3
				y = -4.4
			when 6
				x = 97.6
				y = 2.6
			when 7
				x = 97.6
				y = 11.6
			when 8
				x = 97.6
				y = 21.6
			when 9
				x = 97.6
				y = 30.6
			end
		else
			x = 0
			y = 0
		end
		return x,y
	end

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
				pos = mapShelf(s, shelf)
				Shelf.create!(
					floor: floor.to_s(),
					subject: subject.sample,
					section: s.to_s(),
					shelf_number: shelf.to_s(),
					x: pos[0],
					y: pos[1]
				)
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
