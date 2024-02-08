json.extract! person, :id, :gender, :first_name, :last_name, :birth_date, :address, :phone_number, :email, :is_teacher, :locality_id, :created_at, :updated_at
json.url person_url(person, format: :json)
