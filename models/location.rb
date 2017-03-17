class Location < ActiveRecord::Base
  has_many :clients
  has_many :carers
end
