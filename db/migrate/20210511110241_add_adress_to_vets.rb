class AddAdressToVets < ActiveRecord::Migration[6.0]
  def change
    add_column :vets, :adress, :string
  end
end
