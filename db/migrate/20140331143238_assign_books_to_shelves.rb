class AssignBooksToShelves < ActiveRecord::Migration
  def change
		add_column :books, :shelf_id, :integer
  end
end
