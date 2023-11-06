class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :is_admin?, only: :admin
  def home

    @cities = City.all.order(view: :desc)
    @cities = @cities.where(status: 1) if !current_user || !is_admin?
    @cities = @cities.limit(3) 
    @featured = Feature.last(3)
  end

  def admin
   unless is_admin?
    redirect_to root_url
    flash[:notice] = 'You are not allowed'
   end
      @city = City.new
      @country = Country.new
  end

  def dashboard
  end

  def contact_us
    if verify_recaptcha
      ReviewMailer.contact_us(params[:content], params[:name], params[:email]).deliver_now
      flash[:alert] = 'Mail has been sent!'
      redirect_to root_url
    else
      flash[:notice] = 'Please complete the captcha'
      redirect_to root_url
    end
  end
  
  private
  def is_admin?
    current_user.admin == true
  end
end
