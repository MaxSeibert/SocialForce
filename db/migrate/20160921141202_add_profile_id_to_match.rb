class AddProfileIdToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :profileid, :integer
  end
end
