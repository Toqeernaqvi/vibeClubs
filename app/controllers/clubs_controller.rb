class ClubsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_club, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @clubs = Club.all
    if params[:city].present?
      @city = City.where("cities.name ILIKE ?", "%#{params[:city]}%").first
      @clubs = @city.clubs.order(:name)
      @admin_user = current_user ? current_user.admin : false
    end

    if params[:public].present?
      @clubs = @clubs.where(for_who: 'Public')
    end

    if params[:table].present?
      @clubs = @clubs.where(table_service: 'true')
    end
  end

  def show
    @admin_user = current_user ? current_user.admin : false
    @similar = Club.where.not(id: @club.id)
    @club.page_visitor += 1
    @club.save
    @similar = @similar.where(status: 1) if !current_user || !is_admin?
    @similar = @similar.where(city: @club.city).limit(3)
   
  end

  def deactivate_club
    club = Club.find_by_id(params[:id])
  
    if club.update(status: (params[:status] == "active" ? 0 : 1))
      params[:status] == "active" ? flash[:success] = 'Club is deactivated' :  flash[:success] = 'Club is activated'
    else
      flash[:alert] = 'Failed to change club status'
    end

    render json: flash
  end

  def edit
  end

  def update
    @club.update(club_params)
    if @club.save
      redirect_to @club
      flash[:notice] = 'Club created'
    else
      render :edit
    end
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.create(club_params)
    @club.user = current_user
    if @club.save!
      redirect_to @club
    else
      render :new
    end
  end

  def destroy
    @club.destroy
    redirect_to dashboard_path
  end

  private

  def set_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.require(:club).permit(:name, :address, :for_who, :table_service, :dress_code, :genre, :open_from, :closes_at,
                                :website, :instagram, :country_id, :facebook, :city_id, photos: [], day: [])
  end

  def is_admin?
    current_user.admin == true
  end
end
