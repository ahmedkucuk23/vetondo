class ReviewsController < ApplicationController
  def create
    @vet = Vet.find(params[:vet_id])
    @review = Review.new(review_params)
    @review.vet = @vet
    if @review.save
      redirect_to vet_path(@vet)
    else
      render 'vets/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
