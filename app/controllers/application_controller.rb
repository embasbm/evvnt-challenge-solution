class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_venues, :get_edge_dates, unless: :ajax_request?

  layout :set_layout

  protected

  def set_layout
    ajax_request? ? false : 'application' # layout is false for ajax requests
  end

  def ajax_request?
    request.xhr?
  end

  def find_venues
    @venues = Venue.all
  end

  def get_edge_dates
    @min_date = Event.minimum(:start_time)
    @max_date = Event.maximum(:start_time)
  end
end
