class EventsController < ApplicationController
  before_action :find_event, only: [:edit, :update, :show, :destroy]

  def index
    @events = Event.filter(search_params).paginate(page: params[:page])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)

    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render 'edit'
    end
  end

  def show; end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  def past
    @events = Event.past.filter(search_params).paginate(page: params[:page])
  end

  def upcoming
    @events = Event.upcoming.filter(search_params).paginate(page: params[:page])
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :cover, :started_at, :link, :remote_cover_url, :address)
  end

  def search_params
    params.permit(:start_date, :end_date, :address)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
