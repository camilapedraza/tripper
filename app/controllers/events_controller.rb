class EventsController < ApplicationController
  before_action :set_trip, only: %i[show new create edit update add_file]
  before_action :set_event, only: %i[show edit update destroy view_file]

  def index
  end

  def show
    @back_url = trip_path(@trip)
    @task = Task.new
  end

  def new
    @back_url = trip_path(@trip)
    @event = Event.new
  end

  def create
    @back_url = trip_path(@trip)
    @event = Event.new(event_params)
    @event.trip = @trip
    if @event.save
      # redirect_to trip_event_path(@trip, @event)
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def add_file
    @back_url = trip_path(@trip)
    @event = Event.find(params[:id])
  end

  def destroy
    @event.destroy
    redirect_to trip_path(@trip), status: :see_other
  end

  def update
    file_label = params[:file_label]
    if @event.update(event_params)
      update_filename(file_label) if @event.files.attached?
      redirect_to trip_event_path(@trip, @event)
    else
      @event = @trip.event
      render "events/show", status: :unprocessable_entity
    end
  end

  def view_file
    @back_url = trip_event_path(@trip, @event)
    @file = @event.files_blobs.find(params[:blob_id])
  end

  def detach_file
    @event = Event.find(params[:event_id])
    @trip = @event.trip
    @file = @event.files_blobs.find(params[:blob_id])
    @file.attachments.first.purge
    redirect_to trip_event_path(@trip, @event), status: :see_other
  end

  private

  def update_filename(label)
    # preserve original extension
    extension = @event.files.last.filename.extension
    # rename using user-selected label + original extension
    filename = "#{label}.#{extension}"
    @event.files.last.update(filename:)
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_event
    @event = Event.find(params[:id])
    @trip = @event.trip
  end

  def event_params
    params.require(:event).permit(:name,
                                  :event_type,
                                  :start_date,
                                  :end_date,
                                  :start_location,
                                  :end_location,
                                  :provider,
                                  :reservation_number,
                                  :transport_number,
                                  :seat_number,
                                  :notes,
                                  :provider_phone,
                                  :provider_email,
                                  :files)
  end
end
