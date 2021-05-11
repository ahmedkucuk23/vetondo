class AddCoordinatesToVets < ActiveRecord::Migration[6.0]
  def change
    add_column :vets, :latitude, :float
    add_column :vets, :longitude, :float
  end
end
