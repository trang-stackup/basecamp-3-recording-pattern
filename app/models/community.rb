class Community < ApplicationRecord
  include Edgeable

  include Recordable

  belongs_to :account
end
