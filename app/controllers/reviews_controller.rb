class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
  end

  def create
    @club = Club.find(params[:club_id])
    @review = Review.create(name: params[:name], email: params[:email], content: params[:content], stars: params[:stars].to_i)
    @review.club = @club
   
    if verify_recaptcha
      if @review.save
        flash[:alert] = 'Please check your email'
        redirect_to @club
      else
        redirect_to @club
        flash[:notice] = 'Please make sure to fill everything'
      end
    else
      flash[:notice] = 'Please complete the captcha'
      redirect_to @club
    end
  end

  def edit
  end

  def update
    @review = Review.find(params[:id])
    @review.update(confirmed: true)
    @review.save
    redirect_to root_url
    flash[:notice] = 'Your review was confirmed'
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_path
  end
end
