json.array!(@directories) do |directory|
  json.extract! directory, :id, :directory_name, :is_terminal
  json.url directory_url(directory, format: :json)
end
