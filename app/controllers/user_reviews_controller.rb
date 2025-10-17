class UserReviewsController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @user_review = UserReview.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @user_review = UserReview.new(user_review_params)
    @user_review.cocktail = @cocktail
    @user_review.user = current_user
    # raise
    if @user_review.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new", content: :unprocessable_content
    end
  end

  def edit
    @user_review = UserReview.find(params[:id])
  end

  def update
    @user_review = UserReview.find(params[:id])
    @cocktail = @user_review.cocktail

    if @user_review.update(user_review_params)
      redirect_to cocktail_path(@cocktail)
    else
      render edit, content: :unprocessable_content
    end

  end


  def destroy
    @user_review = UserReview.find(params[:id])
    @cocktail = @user_review.cocktail

    if @user_review.destroy
      redirect_to cocktail_path(@cocktail)
    else
      render :show, status: :unprocessable_content
    end
  end

  private

  def user_review_params
    params.require(:user_review).permit(:title, :rating, :review, :img_1, :img_2, :img_3, :cocktail_id, :user_id)
  end

end
