class RemoveCourseIdToCourse < ActiveRecord::Migration
  def change
		remove_column :courses, :course_id, :string
  end
end
