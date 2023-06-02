class Pathway < ApplicationRecord
  include Recordable

  has_many :communities, through: :parents, source: :recordable, source_type: "Community"
  has_many :skills, through: :children, source: :recordable, source_type: "Skill"
end
