class Client < ActiveRecord::Base
  has_secure_password
  belongs_to :locations
end