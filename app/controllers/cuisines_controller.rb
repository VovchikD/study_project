class CuisinesController < ApplicationController
  before_action :require_user, only: [:show]
  attr_accessor :recipe
  
  def index
        @cuisines = Cuisine.all
    end

    def show
      @cuisines = Cuisine.find(params[:id])
      @recipe = Recipse.all
    end

end
