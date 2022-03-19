json.extract! quiz, :id, :title, :description, :requested_time, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
