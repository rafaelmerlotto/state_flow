class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find_by(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    
    if @ticket.save!
      render :show, notice: "Successfully"
    else
      render :new, notice: "Error"
    end

  end

  private
  def ticket_params
    params.require(:ticket).permit(:title, :description, :status)
  end
end