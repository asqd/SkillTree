class CreateSpecialties < ActiveRecord::Migration[5.0]
  def change
    create_table :specialties do |t|
      t.integer :spec_id
      t.string :spec_name
      t.integer :spec_type
      t.integer :spec_mode

      t.timestamps
    end
  end
end
