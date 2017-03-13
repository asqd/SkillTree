class AddNewColumnsToSpecialty < ActiveRecord::Migration[5.0]
  def change
    add_column :specialties, :code, :string
    add_column :specialties, :profile, :string
    add_column :specialties, :qualification, :string
  end
end
