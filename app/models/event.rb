class Event < ApplicationRecord
  EVENT_TYPES = %w[journey flight train bus boat rental stay restaurant show visit other]
  FILE_LABELS = ["Boarding Pass", "Visa", "Passport", "Loyalty Card", "Vaccinations"]

  before_save :geocode_endpoints
  belongs_to :trip

  has_many :tasks, dependent: :destroy
  has_many_attached :files

  validates :event_type, inclusion: { in: EVENT_TYPES }
  validates :start_date, presence: true
  # MISSING: FIX VALIDATIONS - MOST EVENTS NEED START AND END DATES, AND START AND END LOCATIONS TO WORK
  # validates :end_date, presence: true, if: :journey? || :flight? || :train? || :bus? || :boat? || :stay?
  validates :name, presence: true, if: :other?

  # with_options if: :flight? do
  #   validates :
  # end
  def journey?
    event_type == "journey"
  end

  def flight?
    event_type == "flight"
  end

  def train?
    event_type == "train"
  end

  def bus?
    event_type == "bus"
  end

  def boat?
    event_type == "boat"
  end

  def rental?
    event_type == "rental"
  end

  def stay?
    event_type == "stay"
  end

  def restaurant?
    event_type == "restaurant"
  end

  def show?
    event_type == "show"
  end

  def visit?
    event_type == "visit"
  end

  def other?
    event_type == "other"
  end

  def format_start_time
    start_date.strftime("%I:%M%P")
  end

  def format_start_date
    start_date.strftime("%b %d")
  end

  def format_end_time
    # MISSING: MOVE THE TRY METHOD TO SHOW
    end_date&.strftime("%I:%M%P")
  end

  def format_end_date
    # MISSING: MOVE TRY METHOD TO SHOW
    end_date&.strftime("%b %d")
  end

  def format_duration_h_min
    duration
    hours = (duration / 3600).to_i
    minutes = ((duration % 3600) / 60).to_i
    # MISSING: refacto these three lines:
    formatted = "#{hours}h"
    formatted << (" #{minutes}min") if (duration % 3600).positive?
    formatted
  end

  def format_duration_d
    duration.to_i / 86_400
  end

  # get start_location_data.city or start_location_data.country, etc.
  # start_location_data needs to be full json response
  def start_location_data
    coordinates = "#{start_latitude},#{start_longitude}"
    response = geocoder_backward_search(coordinates)
    response if response.present?
  end

  def end_location_data
    coordinates = "#{end_latitude},#{end_longitude}"
    response = geocoder_backward_search(coordinates)
    response if response.present?
  end

  def geocoder_backward_search(coordinates)
    Geocoder.search(coordinates).first
  end

  private

  def duration
    # MISSING: REVIEW THIS AND MOVE TO SHOW
    return 0 unless end_date && start_date

    end_date - start_date
  end

  # Method to add coordinates for both location from an event
  def geocode_endpoints
    if start_location_changed?
      geocoded = Geocoder.search(start_location).first
      if geocoded
        self.start_latitude = geocoded.latitude
        self.start_longitude = geocoded.longitude
      end
    end
    if end_location_changed?
      geocoded = Geocoder.search(end_location).first
      if geocoded
        self.end_latitude = geocoded.latitude
        self.end_longitude = geocoded.longitude
      end
    end
  end
end
