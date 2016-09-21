class Matches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :name
      t.string :location
      t.integer :score
      t.string :projecttype
      t.string :milestones
                 
      t.date :tfrom
      t.date :tto

      t.integer :amount
      t.integer :equipment
      t.integer :staff
                 
      t.timestamps
    end
  end
end
