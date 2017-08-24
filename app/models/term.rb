class Term < ApplicationRecord
  has_many :responses
  accepts_nested_attributes_for :responses
  belongs_to :model

  def model_response
    responses.order(:points).last
  end
end
