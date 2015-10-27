class TicketsController < ApplicationController
  def entry
    Ticket.track(params)
  end
end
