class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def show
    @ticket = Ticket.find_by(params[:id])
  end

  def edit
    @ticket = Ticket.find_by(params[:id])
  end

  def update
    @ticket = Ticket.find_by(params[:id])
    if @ticket.update(ticket_params)
      redirect_to @ticket
  end

  def destroy
    @ticket = Ticket.find_by(params[:id])
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
    )
  end

end
