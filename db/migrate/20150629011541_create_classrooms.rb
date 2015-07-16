class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
			t.integer :number_of_pupils

			t.references :school
      t.timestamps null: false
    end
  end
end
