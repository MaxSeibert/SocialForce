class Profiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :location
      t.string :impactfocus
      
      t.string :projecttype
      t.string :projectname
      t.string :milestones
      
      t.date :tfrom
      t.date :tto

      t.string :resources
      
      t.timestamps
    end
  
  end
end
