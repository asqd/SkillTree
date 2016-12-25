class AddHoursToLinkSpecialtyDispiline < ActiveRecord::Migration[5.0]
  def change
    add_column :link_specialty_disciplines, :hours, :integer
  end
end
