class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new", content: :unprocessable_content
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = Cocktail.find(params[:cocktail_id])

    if @dose.destroy
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show", status: :unprocessable_content
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:name, :cocktail_id, :ingredient_id)
  end
end
