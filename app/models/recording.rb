class Recording < ApplicationRecord
  belongs_to :account

  has_many :sources, class_name: "Edge", foreign_key: "dest_id", dependent: :destroy
  has_many :dests, class_name: "Edge", foreign_key: "source_id", dependent: :destroy

  delegated_type :recordable, types: %w[Community Pathway Skill LearningModule Tutorial]
end
