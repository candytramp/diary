json.array!(@tasks) do |task|
  json.extract! task, :id, :user_id, :place_id, :priority, :date
  json.url task_url(task, format: :json)
end
