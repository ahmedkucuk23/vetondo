class VetsController < ApplicationController
  before_action :find_vet, only: [:show, :edit, :update, :destroy]
  def index
    @vets = Vet.all
    @vet = policy_scope(Vet)
  end

  def show
    find_vet
  end

  def new
    @vet = Vet.new
    authorize @vet
  end

  def create
    @vet = Vet.new(vet_params)
    #@vet.user = current_user
    authorize @vet
    @vet.save
    redirect_to vet_path(@vet)
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def edit
    find_vet
  end

  def update
    find_vet
    @vet.update(vet_params)
    redirect_to vet_path(@vet)
  end

  def destroy
    find_vet
    @vet.destroy
    redirect_to vets_path
  end

  private

  def vet_params
    params.require(:vet).permit(:name, :description, :price, :speciality, :address)

  end

  def find_vet
    @vet = Vet.find(params[:id])
    authorize @vet
  end

end
