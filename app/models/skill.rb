class Skill < ApplicationRecord
  include Edgeable
  has_many :edgeable_pathways, through: :edge_sources, source: :source, source_type: "Pathway"
  has_many :edgeable_learning_modules, through: :edge_dests, source: :dest, source_type: "LearningModule"

  include Recordable
  has_many :pathway_recordings, -> { where(recordable_type: "Pathway") }, through: :recording, source: :inverse_edges
  has_many :pathways, through: :pathway_recordings, source: :recordable, source_type: "Pathway"

  has_many :learning_module_recordings, -> { where(recordable_type: "LearningModule") }, through: :recording, source: :edges
  has_many :learning_modules, through: :learning_module_recordings, source: :recordable, source_type: "LearningModule"
end
