json.extract! course, :id, :name, :is_archived, :created_at, :updated_at
json.url course_url(course, format: :json)
