class Tutors < ActiveRecord::Migration
  def change
  	create_table :tutors do |t|
  		t.string :name
  		t.timestamps
  	end
  end
end
