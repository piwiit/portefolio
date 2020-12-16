json.extract! project, :id, :title, :desciption, :url, :created_at, :updated_at
json.url project_url(project, format: :json)
