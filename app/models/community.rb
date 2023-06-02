class Community < ApplicationRecord
  include Recordable

  # belongs_to :account
  has_one :bucket, as: :bucketable, touch: true
end
