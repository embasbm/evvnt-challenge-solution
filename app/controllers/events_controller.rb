class EventsController < ApplicationController
  include AbstractController::Callbacks

  def index

    @events = Event.order(:start_time).page(params[:page]).per(5)
    @events = @events.by_keyword(params[:keyword]) if params[:keyword].present?
    @events = @events.where('start_time > ?', Time.parse(params[:date_from])) if params[:date_from].present?
    @events = @events.where('start_time < ?', Time.parse(params[:date_to])) if params[:date_to].present?
    @events = @events.where(venue_id: params[:venue_id]) if params[:venue_id].present?
  end

end
