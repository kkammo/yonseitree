json.array!(@directory_homeworks) do |directory_homework|
  json.extract! directory_homework, :id, :class_name, :directory_class_id
  json.url directory_homework_url(directory_homework, format: :json)
end
