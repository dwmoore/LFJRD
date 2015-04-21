class VisitorsController < ApplicationController
  layout "landing"

  def index
    @profiles = Profile.first(6)
  end
end
