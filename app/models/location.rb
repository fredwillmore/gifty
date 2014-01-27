class Location < ActiveRecord::Base
#  attr_accessible :address, :latitude, :longitude
  geocoded_by :address # can be a method if multiple fields
  after_validation :geocode, :if => :address_changed? # geocoding by googlemaps api by default - maybe move to external process
  # TODO: reverse geocoding by lat/long loses track of suite/unit/apt numbers
  # maybe I can do some fancy ajax that suggests addresses like gmaps does, and have a separate field for unit#
  #after_validation :reverse_geocode
  reverse_geocoded_by :latitude, :longitude
  belongs_to :locatable, polymorphic: true
end
