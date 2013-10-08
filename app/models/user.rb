class User < ActiveRecord::Base
  attr_accessible :admin, :email, :firstname, :lastname, :password, :password_confirmation
  belongs_to :company
  acts_as_authentic
  
end
