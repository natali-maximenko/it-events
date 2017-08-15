class EventsController < ApplicationController
  before_action :find_event, only: [:show]

  def index
    @events = Event.joins(:organizer)
      .select("events.*, organizers.name as organizer_name")
      .filter(search_params)
      .page(params[:page])
  end

  def show
  end

  def past
    @events = Event.past
      .joins(:organizer)
      .select("events.*, organizers.name as organizer_name")
      .filter(search_params)
      .page(params[:page])
  end

  def upcoming
    @events = Event.upcoming
      .joins(:organizer)
      .select("events.*, organizers.name as organizer_name")
      .filter(search_params)
      .page(params[:page])
  end

  private

  def search_params
    params.permit(:start_date, :end_date, :address, :organizer)
  end

  def find_event
    @event = Event.includes(:organizer).find params[:id]
  end
end
