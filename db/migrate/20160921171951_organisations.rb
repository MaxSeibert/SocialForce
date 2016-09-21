class Organisations < ActiveRecord::Migration[5.0]
  def change
    create_table :organisations do |t|
      t.string :oname
      t.string :olocation
      t.string :oimpactfocus
      t.string :oprojecttype
      t.string :omilestones
                 
      t.date :otfrom
      t.date :otto

      t.integer :oamount
      t.integer :oequipment
      t.integer :ostaff
                 
      t.timestamps
    end
  end
end
