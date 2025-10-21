class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def user_profile
    @user = current_user
    @cocktails = @user.cocktails
  end

  def journal
    @user = current_user
    @cocktails = @user.cocktails
    @cocktail_favs = @user.favorited_cocktails
  end
end
