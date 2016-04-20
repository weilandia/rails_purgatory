json.array!([@submissions].flatten) do |submission|
  json.(submission, :id, :user_exercise_id, :encoded_text, :text)
end
