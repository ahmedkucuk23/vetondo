class VetsController < ApplicationController

  def index
    @vets = Vet.all
  end

  def show
    @vet = Vet.find(params[:id])
  end

  def new
    @vet = Vet.new
  end

  def create
    @vet = Vet.new(vet_params)
    @vet.save
    redirect_to vet_path(@vet)
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def edit
    @vet = Vet.find(params[:id])
  end

  def update
    @vet = Vet.find(params[:id])
    @vet.update(vet_params)
    redirect_to vet_path(@vet)
  end

  def destroy
    @vet = Vet.find(params[:id])
    @vet.destroy
    redirect_to vets_path
  end

  private

  def vet_params
    params.require(:vet).permit(:name, :description, :price)
  end

end
