class CreateDisciplines < ActiveRecord::Migration[5.0]
  def change
    create_table :disciplines do |t|
      t.string :name
      t.string :label

      t.timestamps
    end
  end
end
