class Response < ApplicationRecord
  belongs_to :term, required: false
  has_many :answers
end
