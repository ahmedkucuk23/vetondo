class AddSpecialityToVets < ActiveRecord::Migration[6.0]
  def change
    add_column :vets, :speciality, :string
  end
end
