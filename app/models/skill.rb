class Skill < ApplicationRecord
  include Recordable

  has_many :pathways, through: :parents, source: :recordable, source_type: "Pathway"
  has_many :learning_modules, through: :children, source: :recordable, source_type: "LearningModule"
end
