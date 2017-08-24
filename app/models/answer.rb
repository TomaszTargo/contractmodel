class Answer < ApplicationRecord
  validates :stage, presence: true, inclusion: { in: %w(draft final) }

  belongs_to :term
  belongs_to :customer
  belongs_to :response
end
