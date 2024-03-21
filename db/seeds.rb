# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Seed localities table with 10 localities of Switzerland
localities = [
  { ZIP: '1000', locality: 'Lausanne' },
  { ZIP: '1200', locality: 'Genève' },
  { ZIP: '3000', locality: 'Berne' },
  { ZIP: '4000', locality: 'Bâle' },
  { ZIP: '5000', locality: 'Aarau' },
]

localities.each do |locality|
  Locality.create!(ZIP: locality[:ZIP], locality: locality[:locality])
end

# Seed roles table with 3 roles
roles = ['Student', 'Teacher', 'Dean']

roles.each do |role|
  Role.create!(role: role)
end

# Seed people table with 10 people
locality = Locality.first
role = Role.first

20.times do |i|
  Person.create!(
    gender: ['Monsieur', 'Madame'].sample,
    first_name: "Prénom#{i}",
    last_name: "Nom#{i}",
    birth_date: Date.today - (20 + i).years,
    address: "Adresse #{i}",
    phone_number: "0123456789#{i}",
    email: "personne#{i}@exemple.com",
    locality: locality,
    role: role
  )
end

# Seed semesters table with 6 semesters
semesters = [
  { number: 1, years: '2020-2021' },
  { number: 2, years: '2020-2021' },
  { number: 1, years: '2021-2022' },
  { number: 2, years: '2021-2022' },
]

semesters.each do |semester|
  Semester.create!(number: semester[:number], years: semester[:years])
end


# Seed courses table with 10 courses
courses = [
  { name: "Mathématiques", is_archived: false },
  { name: "Physique", is_archived: false },
  { name: "Littérature", is_archived: false },
  { name: "Art", is_archived: false },
  { name: "Informatique", is_archived: false },
  { name: "Chimie", is_archived: false },
  { name: "Philosophie", is_archived: false },
  { name: "Biologie", is_archived: false },
  { name: "Économie", is_archived: false },
  { name: "Géographie", is_archived: false }
]

courses.each do |course|
  Course.create!(name: course[:name], is_archived: course[:is_archived])
end

# Seed exams table with 20 exams
first_course_id = Course.first.id
last_course_id = Course.last.id

20.times do |i|
  Exam.create!(
    date: DateTime.now + (i+1).days,
    title: "Examen #{i+1}",
    coefficient: [1, 1.5, 2].sample,
    course_id: rand(first_course_id..last_course_id)
  )
end


#Seeds for the localities table
localities = [
  { ZIP: '1000', locality: 'Lausanne' },
  { ZIP: '1400', locality: 'Yverdon-les-Bains' },
  { ZIP: '1820', locality: 'Montreux' },
  { ZIP: '1260', locality: 'Nyon' },
  { ZIP: '1800', locality: 'Vevey' },
  { ZIP: '1196', locality: 'Gland' },
  { ZIP: '1110', locality: 'Morges' },
  { ZIP: '1020', locality: 'Renens' },
  { ZIP: '1008', locality: 'Prilly' },
  { ZIP: '1814', locality: 'La Tour-de-Peilz' },
  { ZIP: '1009', locality: 'Pully' },
  { ZIP: '1095', locality: 'Lutry' },
  { ZIP: '1024', locality: 'Ecublens' },
  { ZIP: '1860', locality: 'Aigle' },
  { ZIP: '1854', locality: 'Leysin' },
  { ZIP: '1096', locality: 'Cully' },
  { ZIP: '1180', locality: 'Rolle' },
  { ZIP: '1350', locality: 'Orbe' },
  { ZIP: '1660', locality: "Château-d'Oex" },
  { ZIP: '1071', locality: 'Rivaz' }
]

localities.each do |locality|
  Locality.create!(ZIP: locality[:ZIP], locality: locality[:locality])
end
