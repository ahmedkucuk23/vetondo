class ReviewsController < ApplicationController
  def create
    @vet = Vet.find(params[:vet_id])
    @review = Review.new(review_params)
    @review.vet = @vet
    authorize @vet
    if @review.save
      redirect_to vet_path(@vet, anchor: "review_#{@review.id}")
    else
      render 'vets/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
