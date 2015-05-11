class Event < ActiveRecord::Base
  belongs_to :meeting
  has_many :commentevents, :dependent => :destroy
  has_many :eventusers, :dependent => :destroy
end
