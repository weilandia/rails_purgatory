json.array!([@submissions].flatten) do |submission|
  json.(submission, :id, :user_exercise_id, :solution, :encoded_solution)
end
