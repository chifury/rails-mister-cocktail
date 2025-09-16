class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      render "index", content: :unprocessable_content
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
