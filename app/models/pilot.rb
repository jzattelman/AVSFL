class Pilot < ActiveRecord::Base
  attr_accessible :arn, :first_name, :last_name, :uav_certified
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  has_many :sessions, :as => :chief_pilot
  has_many :sessions, :as => :remote_pilot
 
  has_many :flights, :through => :sessions
  has_many :pilot_fitness_files

  belongs_to :company

  def lastflighttime
  	lastsession =  sessions.order("date ASC").last.date
    comparedate = Date.new(lastsession.year, lastsession.month, lastsession.day)
    today = Date.today
    datediff = (today - comparedate).to_i
    if datediff > 30
      days = datediff % 30
      output = "#{(datediff/30).to_i} months, #{days} days ago"
    else
      output = "#{datediff} days ago"
    end

    return output
  end	

end
