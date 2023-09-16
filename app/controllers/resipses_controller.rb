class ResipsesController < ApplicationController
  before_action :require_user, only: [:show, :edit, :update]
  

  def index
    @recipe = Recipse.all
  end

  def show
    @recipe = Recipse.find_by(params[:id])
  end

  def edit
    @recipe = Recipse.find(params[:id])
  end

  def update
    @recipe = Recipse.find(params[:id])
      if @recipe.update(recipe_params)
        redirect_to resipse_url
      else
        render 'edit'
      end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :ingredients, :instructions)
    end
end
