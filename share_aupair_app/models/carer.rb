class Carer < ActiveRecord::Base
  has_secure_password validations false
  belongs_to :locations
end
