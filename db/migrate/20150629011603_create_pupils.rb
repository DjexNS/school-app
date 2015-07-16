class CreatePupils < ActiveRecord::Migration
  def change
    create_table :pupils do |t|
      t.string :name
      t.column :gender, :integer, default: 0
      t.boolean :special, default: false

			t.references :school
			t.references :classroom
      t.timestamps null: false
    end
  end
end
