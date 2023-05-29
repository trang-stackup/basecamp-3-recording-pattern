class Bucket < ApplicationRecord
  belongs_to :account
  belongs_to :bucketable, polymorphic: true
  has_many :recordings

  def record(recordable, parent: nil, **options)
    recordable.save!

    options.merge!(recordable:, parent_id: parent&.id)
    recordings.create!(options)
  end

  # def pathways
  #   recordings.where(recordable_type: "Pathway")
  # end
end
