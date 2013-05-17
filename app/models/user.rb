class User < ActiveRecord::Base
  attr_accessible :id, :name, :shufflerId
  has_many :tracks
end
