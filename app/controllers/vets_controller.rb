class VetsController < ApplicationController
  before_action :find_vet, only: [:show, :edit, :update, :destroy]

  def index
    @vets = Vet.all
    @vet = policy_scope(Vet)
    # if params[:query].present?
    #   @vets = Vet.search_by_name(params[:query])
    # else
    #   @vets = Vet.all
    # end

    @vets = Vet.order(params[:sort])

    if params[:search]
      search_vets
      if params[:sort] == "price"
        @vets = Vet.all.sort_by{|vet| player.price}
      elsif params[:sort] == "name"
        @vets = Vet.order(:name)
      elsif params[:sort] != "price"
       @vets = Vet.order(params[:sort])
      else
        @vets = Vet.all
      end
    end


  end

  def show
    find_vet
  end

  def search_vets
    if @vet = Vet.all.find{|vet| vet.name.include?(params[:search])}
      redirect_to vet_path(@vet)
    end
  end

  def new
    @vet = Vet.new
    authorize @vet
  end

  def create
    @vet = Vet.new(vet_params)
    @vet.user = current_user
    authorize @vet

    @vet.save
    redirect_to vet_path(@vet)
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
    params.require(:vet).permit(:name, :description, :price, :speciality, :address, :photo)
  end

  def find_vet
    @vet = Vet.find(params[:id])
    authorize @vet
  end

end
