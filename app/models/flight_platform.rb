class FlightPlatform < ActiveRecord::Base
  attr_accessible :company_code, :name, :company_id
  belongs_to :company
  has_many :sessions
  has_many :platform_batteries

end
