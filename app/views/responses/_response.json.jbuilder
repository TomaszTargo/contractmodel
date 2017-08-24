json.extract! response, :id, :response, :points, :term_id, :created_at, :updated_at
json.url response_url(response, format: :json)
