class CreateSaes < ActiveRecord::Migration[5.0]
  def change
    create_table :saes do |t|
      t.string :short_name
      t.string :name

      t.timestamps
    end
  end
end
