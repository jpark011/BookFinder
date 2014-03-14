class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
			t.string :title
			t.string :author
			t.string :publisher
			t.string :edition
			t.decimal :price, :precision => 6, :scale => 2
			t.string :required
			t.string :image
      t.timestamps
    end
  end
end
