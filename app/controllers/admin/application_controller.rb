class Admin::ApplicationController < ApplicationController
  before_action :authenticate_organizer!
end
