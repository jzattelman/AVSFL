class Battery < ActiveRecord::Base
  attr_accessible :code, :new_date

  has_many :flights
  has_many :batterycharges
  has_many :batteryuses, :dependent => :destroy
  belongs_to :company
end
