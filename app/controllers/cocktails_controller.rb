class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
    @ingredients = Ingredient.all
    @doses = Dose.all
    @tags = Tag.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = @cocktail.ingredients
    @doses = @cocktail.doses
    @tags = @cocktail.tags
    # raise
  end

  def new
    @cocktail = Cocktail.new
    @cocktail.doses.build.build_ingredient # builds both dose and nested ingredient
    @cocktail.tags.build
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail), notice: "Cocktail was successfully created."
    else
      render "new", status: :unprocessable_content
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render "edit", status: :unprocessable_content
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path, status: :see_other
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, doses_attributes: [:id, :amount, :ingredient_id, { ingredient_attributes: [:id, :name] }, :_destroy], tags_attributes: [:id, :name, :_destroy])
  end
end
