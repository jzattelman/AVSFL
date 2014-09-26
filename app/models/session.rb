class Session < ActiveRecord::Base
  attr_accessible :chief_pilot_id, :client, :date, :gcs_control, :gcs_deployment, :jsa_time, :location, :mission_briefing_time, :observer, :payload, :pre_flight_time, :remote_pilot_id, :task, :weather, :windspeed, :latitude, :longitude, :address, :company_id, :flight_platform_id, :send_email

  geocoded_by :address
  after_validation :geocode, :if => :address?

  belongs_to :company
  has_one :chief_pilot, :class_name => "Pilot", :foreign_key => "chief_pilot_id"
  has_one :remote_pilot, :class_name => "Pilot", :foreign_key => "remote_pilot_id"
  has_one :flight_plaform
  has_many :flights, :dependent => :destroy
  has_many :incidents, :through => :flights, :dependent => :destroy

  validates :location, :presence => true
  validates :chief_pilot_id, :presence => true
  validates :remote_pilot_id, :presence => true
  validates :client, :presence => true
  validates :task, :presence => true
end
