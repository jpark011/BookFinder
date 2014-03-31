class CreateShelves < ActiveRecord::Migration
  def change
    create_table :shelves do |t|
			t.integer :floor
			t.string :subject
			t.integer :section
      t.timestamps
    end
  end
end
