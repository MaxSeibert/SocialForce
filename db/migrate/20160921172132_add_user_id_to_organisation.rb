class AddUserIdToOrganisation < ActiveRecord::Migration[5.0]
  def change
    add_column :organisations, :user_id, :integer
  end
end
