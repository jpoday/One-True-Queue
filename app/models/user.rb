class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :name, :email, :password, :password_confirmation
  
  validates_presence_of :name, :email
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email
  
  has_one :netflix, :class_name=>"NetflixToken", :dependent=>:destroy
end
