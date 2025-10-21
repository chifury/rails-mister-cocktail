class FavoritesController < ApplicationController
  before_action :set_cocktail

  def create
    current_user.favorites.create(cocktail: @cocktail) # assigns and saves user's favorite to cocktail in 'one line'.
    redirect_to @cocktail, notice: "Cocktail added to favorites!"
  end

  def destroy
    current_user.favorites.find_by(cocktail: @cocktail)&.destroy # searches the current user's favorites for a record where the cocktail matches @cocktail. The safe navigation operator (&.) prevents an error if no favorite record exists. It'll just skip .destroy rather than throw an exception. 
    redirect_to @cocktail, notice: "Cocktail removed from favorites!"
  end


  private

  # Keeps code D.R.Y. by setting @cocktail before running the actions as both actions will use the same @cocktail.
  def set_action
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
