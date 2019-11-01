json.extract! response, :id, :cid, :student_id, :questionnaire_id, :created_at, :updated_at
json.url response_url(response, format: :json)
