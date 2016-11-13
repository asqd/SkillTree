class CreateDisciplines < ActiveRecord::Migration[5.0]
  def change
    create_table :disciplines do |t|
      t.string :dis_name
      t.integer :dis_module

      t.timestamps
    end
  end
end
