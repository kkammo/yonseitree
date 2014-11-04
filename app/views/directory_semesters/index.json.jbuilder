json.array!(@directory_semesters) do |directory_semester|
  json.extract! directory_semester, :id, :semester_name
  json.url directory_semester_url(directory_semester, format: :json)
end
