class VetsController < ApplicationController

  def index
    @vets = Vet.all
  end

  def show
    @vet = Vet.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
