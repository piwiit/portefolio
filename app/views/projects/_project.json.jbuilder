json.extract! project,
              :id,
              :title,
              :desciption,
              :url,
              :picture,
              :created_at,
              :updated_at
json.url project_url(project, format: :json)
