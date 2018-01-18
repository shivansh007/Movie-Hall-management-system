class TicketsController < ApplicationController
  protect_from_forgery only: %i[create update destroy]

  def index
    tickets = Ticket.all
    render json: { message: 'Tickets loaded', tickets: tickets }, status: :ok
  end

  def show
    ticket = Ticket.find(params[:id])
    render json: { message: 'Ticket loaded', ticket: ticket }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Ticket not found' }, status: :not_found
  end

  def create
    ticket = Ticket.create(ticket_params)
    if ticket.save
      render json: { message: 'Ticket created', ticket: ticket }, status: :ok
    else
      render json: { message: ticket.errors }, status: :unprocessable_entity
    end
  end

  def update
    ticket = Ticket.find(params[:id])
    if ticket.update_attributes(ticket_params)
      render json: { message: 'Ticket updated', ticket: ticket }, status: :ok
    else
      render json: { message: ticket.errors }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Ticket not found' }, status: :not_found
  end

  def destroy
    ticket = Ticket.find(params[:id])
    ticket.destroy
    render json: { message: 'Ticket deleted', ticket: nil }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Ticket not found' }, status: :not_found
  end

  private

  def ticket_params
    params.require(:ticket).permit(:booking_id, :seat_id, :show_time_id)
  end
end
