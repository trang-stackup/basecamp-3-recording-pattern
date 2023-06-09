class Recording < ApplicationRecord
  belongs_to :account

  delegated_type :recordable, types: %w[Pathway Skill LearningModule Tutorial]
end
