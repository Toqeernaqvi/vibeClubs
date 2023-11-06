class CountriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  def index
    @countries = Country.order(name: :asc)
    @countries = @countries.where(status: 1) if !current_user || !is_admin?
    
  end

  def show
    @admin_user = current_user ? current_user.admin : false
    @cities = @country.cities.order(name: :asc)
    @cities = @cities.where(status: 1) if !current_user || !is_admin?
    @country.page_visitor += 1
    @country.save
    respond_to do |format|
      format.html
      format.json { render json: { country: @country, cities: @country.cities } }
    end
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to admin_path
    else
      redirect_to admin_path
      flash[:notice] = 'Could not create'
    end
  end

  def edit
  end

  def update
    @country.update(country_params)
    if @country.save
      redirect_to admin_path
    end
  end
  
  def deactivate_country
    country = Country.find_by_id(params[:id])
  
    if country.update(status: (params[:status] == "active" ? 0 : 1))
      params[:status] == "active" ? flash[:success] = 'Country is deactivated' :  flash[:success] = 'Country is activated'
    else
      flash[:alert] = 'Failed to change country status'
    end

    render json: flash
  end

  def destroy
    @country.destroy
    redirect_to admin_path
  end

  private

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name, :image)
  end

  def is_admin?
    current_user.admin == true
  end

end
