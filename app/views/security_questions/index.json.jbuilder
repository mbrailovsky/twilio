json.array!(@security_questions) do |security_question|
  json.extract! security_question, :id, :question
  json.url security_question_url(security_question, format: :json)
end
