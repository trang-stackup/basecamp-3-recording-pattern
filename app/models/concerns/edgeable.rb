module Edgeable
  extend ActiveSupport::Concern

  included do
    has_many :edge_sources, as: :dest, class_name: "Relationship", dependent: :destroy
    has_many :edge_dests, as: :source, class_name: "Relationship", dependent: :destroy
  end
end
