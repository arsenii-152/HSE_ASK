json.extract! question, :id, :user_id, :quiz_id, :title, :type, :body, :type, :created_at, :updated_at
json.url question_url(question, format: :json)
