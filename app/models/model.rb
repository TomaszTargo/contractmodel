class Model < ApplicationRecord
  has_and_belongs_to_many :customers
  belongs_to :user
  has_many :terms
end
