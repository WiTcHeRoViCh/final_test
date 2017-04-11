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

  def new_tweet
    @place = Place.find(params[:place_id])
    client = Twitter::REST::Client.new do |config|
      config.consumer_key       = 'DtkMydbOtwjHPsnUZ06PGzNOD'
      config.consumer_secret    = 'PgC5hwj3Noho18ZqEcZ2D1jGP2ZGg4rGdqkRBV799lekIZycLG'
      config.oauth_token        = '849584732119728129-cu4rJGReIxTXU3NwhhD1mtVw4qpFYHc'
      config.oauth_token_secret = 'YoSoXzWZSwazxrgry5nLtxtXF11pL36EUMFoyrvVJrN1T'
    end
    recomendation = Recomendation.find_by(id: params[:format], place_id: @place.id, user_id: current_user.id)
    if recomendation
      client.update(recomendation.body.to_s+" See more on http://localhost:3000/places/#{@place.id}")
    end
      
    redirect_to @place
  end

  private

  def current_place
    @place = Place.find(params[:id])
  end	

  def place_params
  	params.require(:place).permit(:name)
  end

end
