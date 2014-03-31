class AddShelfNumber < ActiveRecord::Migration
  def change
		add_column :shelves, :shelf_number, :integer
  end
end
