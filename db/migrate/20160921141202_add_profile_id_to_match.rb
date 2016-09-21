class AddProfileIdToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :profile_id, :integer
  end
end
