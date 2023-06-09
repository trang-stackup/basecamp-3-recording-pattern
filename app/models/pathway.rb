class Pathway < ApplicationRecord
  include Edgeable
  has_many :edgeable_skills, through: :edge_dests, source: :dest, source_type: "Skill"

  include Recordable
  has_many :skill_recordings, -> { where(recordable_type: "Skill") }, through: :recording, source: :edges
  has_many :skills, through: :skill_recordings, source: :recordable, source_type: "Skill"
end
