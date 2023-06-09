class Edge < ApplicationRecord
  belongs_to :source, class_name: "Recording", foreign_key: "source_id"
  belongs_to :dest, class_name: "Recording", foreign_key: "dest_id"
end
