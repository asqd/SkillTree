class CreateSpecialties < ActiveRecord::Migration[5.0]
  def change
    create_table :specialties do |t|
      t.integer :spec_id
      t.string :name
      t.integer :type
      t.integer :mode

      t.timestamps
    end
  end
end
