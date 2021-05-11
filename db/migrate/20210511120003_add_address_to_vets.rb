class AddAddressToVets < ActiveRecord::Migration[6.0]
  def change
    add_column :vets, :address, :string
  end
end
