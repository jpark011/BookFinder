class CreateStudents < ActiveRecord::Migration
  def change
		drop_table :students
    create_table :students do |t|
      t.timestamps
    end
  end
end
