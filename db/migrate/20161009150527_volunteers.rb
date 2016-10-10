class Volunteers < ActiveRecord::Migration[5.0]
  def change
     create_table :volunteers do |t|
      t.string :name
      t.string :time
      t.string :date
      t.timestamps
    end
  end
end
