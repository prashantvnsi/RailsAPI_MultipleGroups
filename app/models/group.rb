class Group < ApplicationRecord
  belongs_to :region
  has_many :members
end
