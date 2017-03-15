class Client < ActiveRecord::Base
  has_secure_password
  # validates :password
  belongs_to :locations
ends
