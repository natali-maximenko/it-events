class Admin::OrganizersController < Admin::ApplicationController
  before_action :organizer, only: [:edit, :update]

  def update
    if @org.update(org_params)
      redirect_to @org
    else
      render :edit
    end
  end

private
  def org_params
    params.require(:organizer).permit(:email, :name, :description)
  end

  def organizer
    @org = Organizer.find(params[:id])
  end
end
