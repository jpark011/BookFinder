class AddBooksToCourses < ActiveRecord::Migration
  def change
		create_table :books_courses do |t|
      t.belongs_to :course
      t.belongs_to :book
    end
  end
end
