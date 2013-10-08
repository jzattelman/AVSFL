class Pilot < ActiveRecord::Base
  attr_accessible :arn, :first_name, :last_name, :uav_certified
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  has_many :sessions, :as => :chief_pilot
  has_many :sessions, :as => :remote_pilot
 
  has_many :flights, :through => :sessions
  has_many :pilot_fitness_files

  belongs_to :company

end
