class CreateGifts < ActiveRecord::Migration[5.0]
  def change
    create_table :gifts do |t|
      t.string :giftname
      t.string :heading
      t.string :image
      t.timestamps
    end
  end
end
