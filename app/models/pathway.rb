class Pathway < ApplicationRecord
  include Edgeable
  has_many :skills, through: :edge_dests, source: :dest, source_type: "Skill"

  include Recordable
  # has_many :communities, through: :parents, source: :recordable, source_type: "Community"
  has_many :child_edges, through: :recording, source: :children
  has_many :recordable_skills, through: :child_edges, source: :dest, source_type: "Skill"
end
