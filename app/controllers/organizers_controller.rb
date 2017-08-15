class OrganizersController < ApplicationController
  def index
    @organizers = Organizer.includes(:events).page(params[:page])
  end

  def show
    @org = Organizer.includes(:events).find(params[:id])
  end
end
