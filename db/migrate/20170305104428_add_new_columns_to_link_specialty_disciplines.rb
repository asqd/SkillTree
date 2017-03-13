class AddNewColumnsToLinkSpecialtyDisciplines < ActiveRecord::Migration[5.0]
  def change
    add_column :link_specialty_disciplines, :human_short_htype, :string
    add_column :link_specialty_disciplines, :term_number, :integer
  end
end
