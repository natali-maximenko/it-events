class Admin::ApplicationController < ApplicationController
  before_filter :authenticate_organizer!
end
