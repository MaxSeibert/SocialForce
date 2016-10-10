class Program < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :heading
      t.string :description
      t.timestamps
    end
  end
end
