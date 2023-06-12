class Recording < ApplicationRecord
  belongs_to :account

  has_many :source_edges, class_name: "Edge", foreign_key: "source_id", dependent: :destroy
  has_many :edges, through: :source_edges, source: :dest

  has_many :dest_edges, class_name: "Edge", foreign_key: "dest_id", dependent: :destroy
  has_many :inverse_edges, through: :dest_edges, source: :source

  delegated_type :recordable, types: %w[Community Pathway Skill LearningModule Tutorial]
end
