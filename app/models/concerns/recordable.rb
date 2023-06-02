module Recordable
  extend ActiveSupport::Concern

  included do
    # Recordables are immutable. Don't update a recordable, create a new one.
    # has_one :recording, as: :recordable, touch: true
    # a recordable has_many :recordings not one
    has_many :recordings, as: :recordable
    has_many :children, through: :recordings
    has_many :parents, through: :recordings
  end
end
