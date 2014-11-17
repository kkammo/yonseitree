json.array!(@homeworks) do |homework|
  json.extract! homework, :id, :name, :subject_id
  json.url homework_url(homework, format: :json)
end
