class ChangeNameForAdreesInVets < ActiveRecord::Migration[6.0]
  def change
    rename_column :vets, :adress, :address
  end
end
