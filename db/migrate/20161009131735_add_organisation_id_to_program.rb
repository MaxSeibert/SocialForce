class AddOrganisationIdToProgram < ActiveRecord::Migration[5.0]
  def change
     add_column :programs, :oid, :integer
  end
end
