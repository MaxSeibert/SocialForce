class AddOrganisationIdToGift < ActiveRecord::Migration[5.0]
  def change
    add_column :gifts, :oid, :integer
  end
end
