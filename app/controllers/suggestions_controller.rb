class SuggestionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @suggest = Suggestion.create(city: params[:city], country: params[:country], user_id: current_user.id)
   
    if @suggest.save
      flash[:alert] = 'Suggestion added!'
      redirect_to root_path
    else
      redirect_to root_path
      flash[:notice] = 'Please make sure to fill everything'
    end
  end

  def destroy
    @suggest = Suggestion.find(params[:id])
    @suggest.destroy
    redirect_to admin_path
  end
end
