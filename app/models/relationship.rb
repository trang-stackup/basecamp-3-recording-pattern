class Relationship < ApplicationRecord
  belongs_to :source, polymorphic: true
  belongs_to :dest, polymorphic: true
end
