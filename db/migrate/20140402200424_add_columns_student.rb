class AddColumnsStudent < ActiveRecord::Migration
  def change
		add_column :students, :first_name, :string
		add_column :students, :last_name, :string
		add_column :students, :year, :string
		add_column :students, :term, :string
		add_column :students, :user_id, :string
		add_column :students, :password, :string
  end
end
