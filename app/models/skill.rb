class Skill < ApplicationRecord
  include Edgeable
  has_many :pathways, through: :edge_sources, source: :source, source_type: "Pathway"

  include Recordable
  has_many :recordable_pathways, through: :recording, source: :children, source_type: "Pathway"
  # has_many :learning_modules, through: :children, source: :recordable, source_type: "LearningModule"
end
