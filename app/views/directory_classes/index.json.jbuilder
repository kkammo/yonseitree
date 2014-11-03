json.array!(@directory_classes) do |directory_class|
  json.extract! directory_class, :id, :class_name, :directory_semester_id
  json.url directory_class_url(directory_class, format: :json)
end
