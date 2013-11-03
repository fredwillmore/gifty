class Location < ActiveRecord::Base
#  attr_accessible :address, :latitude, :longitude
  geocoded_by :address # can be a method if multiple fields
  after_validation :geocode, :if => :address_changed? # geocoding by googlemaps api by default - maybe move to external process
  belongs_to :merchant
  belongs_to :user
end
