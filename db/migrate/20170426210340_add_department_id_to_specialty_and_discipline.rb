class AddDepartmentIdToSpecialtyAndDiscipline < ActiveRecord::Migration[5.0]
  def change
    add_column :specialties, :department_id, :integer
    add_column :disciplines, :department_id, :integer
  end
end
