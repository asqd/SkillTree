class AddNewColumnsToDiscipline < ActiveRecord::Migration[5.0]
  def change
    add_column :disciplines, :zet, :float
    add_column :disciplines, :practice?, :boolean
  end
end
