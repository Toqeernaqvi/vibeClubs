class FeaturesController < ApplicationController
  before_action :set_feature, only: [:destroy]

  def create
    if !Feature.where(club_id: params[:id]).any?
      @feature = Feature.new(club_id: params[:id])
      if @feature.save
        redirect_to admin_path
      else
        redirect_to root_url
      end
    else
      flash[:notice] = 'This club is already featured'
      redirect_to root_url
    end
  end

  def destroy
    @feature.destroy
    redirect_to root_url
  end

  private

  def set_feature
    @feature = Feature.find(params[:id])
  end

end
