class AddIndexToCourse < ActiveRecord::Migration
  def change
		add_index(:courses, :subject, using: :btree)
  end
end
