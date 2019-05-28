class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
    @venues = Venue.all
    @users = User.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = Ticket.create(ticket_params)
    redirect_to @ticket
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      redirect_to @ticket
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    flash[:notice] = "Ticket Deleted."
  end

  private

  def ticket_params
    params.require(:ticket).permit(
      :event_date,
      :available,
      :user_id,
      :venue_id,
      :artist_name
    )
  end

end
