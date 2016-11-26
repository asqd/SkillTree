class CreateSpecialties < ActiveRecord::Migration[5.0]
  def change
    create_table :specialties do |t|
      t.integer :dtype
      t.string :human_dtype
      t.string :direction
      t.integer :level
      t.string :human_level
      t.integer :study_form
      t.string :human_study_form

      t.timestamps
    end
  end
end
