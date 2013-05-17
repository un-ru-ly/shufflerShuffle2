class User < ActiveRecord::Base
  attr_accessible :name, :shufflerId
  has_many :tracks
end
