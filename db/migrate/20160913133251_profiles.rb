class Profiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :location
      t.string :impactfocus


      t.timestamps
    end
  
  end
end
