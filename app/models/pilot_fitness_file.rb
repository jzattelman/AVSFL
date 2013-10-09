class PilotFitnessFile < ActiveRecord::Base
  attr_accessible :q1, :q10, :q11, :q12, :q13, :q14, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :pilot_id, :date, :pilot_id, :pass
  before_create :finishcreate
  validates :pilot_id, :presence => true
  validates_inclusion_of :q1, :in => [true, false]
  validates_inclusion_of :q2, :in => [true, false]
  validates_inclusion_of :q3, :in => [true, false]
  validates_inclusion_of :q4, :in => [true, false]
  validates_inclusion_of :q5, :in => [true, false]
  validates_inclusion_of :q6, :in => [true, false]
  validates_inclusion_of :q7, :in => [true, false]
  validates_inclusion_of :q8, :in => [true, false]
  validates_inclusion_of :q9, :in => [true, false]
  validates_inclusion_of :q10, :in => [true, false]
  validates_inclusion_of :q11, :in => [true, false]
  validates_inclusion_of :q12, :in => [true, false]
  validates_inclusion_of :q13, :in => [true, false]
  validates_inclusion_of :q14, :in => [true, false]
  belongs_to :pilot
  belongs_to :company
end

def finishcreate
	self.date = Date.today.in_time_zone("Melbourne")
	if(self.q1 == true \
	&& self.q2 == true \
	&& self.q3 == true \
	&& self.q4 == true \
	&& self.q5 == true \
	&& self.q6 == true \
	&& self.q7 == true \
	&& self.q8 == true \
	&& self.q9 == false \
	&& self.q10 == false \
	&& self.q11 == false \
	&& self.q12 == false \
	&& self.q13 == false \
	&& self.q14 == false \
	)
		self.pass = true
	else
		self.pass = false
		Rails.logger.debug "*"*120
	    Rails.logger.debug "Pilot Health File Fail"
	    Rails.logger.debug "*"*120
	end
end
