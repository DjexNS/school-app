class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :title
      t.integer :number_of_classrooms
			t.integer :number_of_pupils

			t.timestamps null: false
    end
  end
end
