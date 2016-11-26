class CreateLinkSpecialtyDisciplines < ActiveRecord::Migration[5.0]
  def change
    create_table :link_specialty_disciplines do |t|
      t.integer :term
      t.integer :htype
      t.string :human_htype
      t.references :specialty, foreign_key: true
      t.references :discipline, foreign_key: true

      t.timestamps
    end
  end
end
