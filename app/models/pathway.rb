class Pathway < ApplicationRecord
  include Recordable

  has_many :skills, through: :children, source: :recordable, source_type: "Skill"
end
