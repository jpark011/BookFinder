class AddBackXandY < ActiveRecord::Migration
  def change
		add_column :shelves, :x, :float
		add_column :shelves, :y, :float
  end
end
