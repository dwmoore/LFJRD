class VisitorsController < ApplicationController
  layout "landing"

  def index
    @profiles = Profile.all
  end
end
