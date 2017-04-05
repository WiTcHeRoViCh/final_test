class PlacesController < ApplicationController
	before_action :current_place, only: [:show]

  def index
    @places = Place.all
  end	

  def show
    @recomends = Recomendation.includes(:place).where(recomend_id: @place.id)
  	@recomend = Recomendation.new
  end

  def new
    @place = Place.new
  end	

  def create
  	place = Place.new(place_params)
  	if place.save
  		redirect_to place
  	else
  		render :new
  	end	
  end

  private

  def current_place
    @place = Place.find(params[:id])
  end	

  def place_params
  	params.require(:place).permit(:name)
  end

end
