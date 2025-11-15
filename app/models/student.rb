class Student < ApplicationRecord
  has_many :assignments, dependent: :destroy
end
