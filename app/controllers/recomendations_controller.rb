class RecomendationsController < ApplicationController
	before_action :current_recommend, only: :destroy

  def create
    Recomendation.create(params_recomend)
    redirect_back fallback_location: root_path
  end	

  def destroy
  	@recomend.delete
  	redirect_back(fallback_location: root_path)
  end

  private

  def params_recomend
  	params.require(:recomendation).permit(:body, :mark, :recomend_type, :recomend_id, :user_id, :sender, :place_id)
  end

  def current_recommend
  	@recomend = Recomendation.find(params[:id])
  end

end