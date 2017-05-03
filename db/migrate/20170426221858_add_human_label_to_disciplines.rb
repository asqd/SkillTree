class AddHumanLabelToDisciplines < ActiveRecord::Migration[5.0]
  def change
    add_column :disciplines, :human_label, :string
  end
end
