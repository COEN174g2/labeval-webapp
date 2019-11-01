json.extract! question, :id, :description, :is_open, :questionnaire_id, :created_at, :updated_at
json.url question_url(question, format: :json)
