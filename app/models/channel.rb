class Channel < ApplicationRecord
  validates :name, uniqueness: true
end
