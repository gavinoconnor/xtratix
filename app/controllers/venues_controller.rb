class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to @venue
    end
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update(venue_params)
      redirect_to @venue
    end
  end

  def search
    @response = @remote.events
    @response.results.each do |result|
    result.venue.metro_area.state
    end

  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    flash[:notice] = "Account Deleted."
    # redirect_to new_venue_path
  end

  private

  def venue_params
    params.require(:venue).permit(
      :name,
      :address
    )
  end
end
