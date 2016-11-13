class CreateLinkSpecialtyDisciplines < ActiveRecord::Migration[5.0]
  def change
    create_table :link_specialty_disciplines do |t|
      t.references :specialty, foreign_key: true
      t.references :discipline, foreign_key: true
      t.integer :term
      t.integer :report

      t.timestamps
    end
  end
end
