class AddColumnToSpecialty < ActiveRecord::Migration[5.0]
  def change
    add_column :specialties, :full_direction, :string
  end
end
