class CreateDepartmentsSaes < ActiveRecord::Migration[5.0]
  def change
    create_table :departments_saes do |t|
      t.belongs_to :department, index: true
      t.belongs_to :sae, index: true

      t.timestamps
    end
  end
end
