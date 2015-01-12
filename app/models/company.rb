class Company < ActiveRecord::Base
  attr_accessible :name, :image, :chiefPilotEmail

  mount_uploader :image, ImageUploader

  has_many :sessions, :dependent => :destroy
  has_many :users, :dependent => :destroy
  has_many :batteries, :dependent => :destroy
  has_many :batterycharges, :dependent => :destroy
  has_many :pilots, :dependent => :destroy
  has_many :pilot_fitness_files, :dependent => :destroy
  has_many :incidents, :dependent => :destroy
  has_many :flight_platforms, :dependent => :destroy

  accepts_nested_attributes_for :users
end
