class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @tag = Tag.new(tag_params)
    @tag.cocktail = @cocktail

    if @tag.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new", content: :unprocessable_content
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @cocktail = Cocktail.find(params[:cocktail_id])

    if @tag.destroy
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show", status: :unprocessable_content
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :cocktail_id)
  end
end
