class CitiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_city, only: [:show, :edit, :update, :destroy, :city_clubs]
  def index
    @cities = City.all
    @cities = @cities.where(status: 1) if !current_user || !is_admin?
    
    respond_to do |format|
      format.html
      format.json { render json: { cities: @cities } }
    end
  end

  def autocomplete
    if params[:city]
      @cities = City.where("cities.name ILIKE ?", "#{params[:city]}%")
      @cities = @cities.joins(:country).where('cities.status = 1 and countries.status = 1') if !current_user || !is_admin?
    else
      @cities = []
    end
    render json: {cities: @cities}
  end

  def show
    @admin_user = current_user ? current_user.admin : false
    @city.view += 1
    @city.save
    @city.page_visitor += 1
    @city.save
    clubs = @city.clubs
    clubs = clubs.where(status: 1) if !current_user || !is_admin?
    @names = clubs.order(:name).map {|club| club.name }
   
    respond_to do |format|
      format.html
      format.json { render json: { city: @city, club_name: @names} }
    end
  end

  def deactivate_city
    if params[:name_search] == 'true'
      city = City.where("cities.name ILIKE ?", "%#{params[:name]}%").first
    else
      city = City.find_by_id(params[:id])
    end
    
    if city.update(status: (params[:status] == "active" ? 0 : 1))
      params[:status] == "active" ? flash[:success] = 'City is deactivated' :  flash[:success] = 'City is activated'
    else
      flash[:alert] = 'Failed to change city status'
    end

    render json: flash
  end

  def update
    @city.update(city_params)
    if @city.save
      redirect_to admin_path
    end
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to admin_path
      flash[:alert] = 'City was created'
    else
      redirect_to admin_path
      flash[:notice] = 'Could not create'
    end
  end

  def destroy
    @city.destroy
    redirect_to admin_path
  end

  def city_clubs
    @clubs = @city.clubs
    @clubs = @clubs.where(status: 1) if !current_user || !is_admin?
  end
  
  def city_clubs_redirect
    flash[:notice] = 'No clubs for that city'
    redirect_to root_url
  end
  
  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :image, :country_id)
  end

  def is_admin?
    current_user.admin == true
  end
end
