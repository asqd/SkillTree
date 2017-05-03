class AddSaeIdToSpecialties < ActiveRecord::Migration[5.0]
  def change
    add_column :specialties, :sae_id, :integer
  end
end
