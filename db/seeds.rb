# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


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
roles = ['Étudiant', 'Enseignant', 'Doyen']
roles.each do |role|
  Role.create!(role: role)
end

# Seed a dean user by default
default_locality = Locality.first
dean_role = Role.find_by(role: "Doyen")
teacher_role = Role.find_by(role: "Enseignant")
student_role = Role.find_by(role: "Étudiant")

dean = Person.create!(
  gender: 'Femme',
  first_name: 'Cindy',
  last_name: 'Hardegger',
  birth_date: DateTime.new(1970,1,1),
  address: '123 Rue Principale',
  phone_number: '+41794567890',
  email: 'hardeggerc@eduvaud.ch',
  locality: default_locality,
  :password => 'password',
  role: dean_role
)
teacher1 = Person.create!(
  gender: 'Homme',
  first_name: 'Julien',
  last_name: 'Ithurbide',
  birth_date: DateTime.new(1970,1,1),
  address: '123 Rue Principale',
  phone_number: '+41794567890',
  email: 'ithurbidej@eduvaud.ch',
  locality: default_locality,
  :password => 'password',
  role: teacher_role
)
teacher2 = Person.create!(
  gender: 'Homme',
  first_name: 'Pascal',
  last_name: 'Hurni',
  birth_date: DateTime.new(1970,1,1),
  address: '123 Rue Principale',
  phone_number: '+41794567890',
  email: 'hurnip@eduvaud.ch',
  locality: default_locality,
  :password => 'password',
  role: teacher_role
)
teacher3 = Person.create!(
  gender: 'Homme',
  first_name: 'Nicolas',
  last_name: 'Glassey',
  birth_date: DateTime.new(1970,1,1),
  address: '123 Rue Principale',
  phone_number: '+41794567890',
  email: 'glasseyn@eduvaud.ch',
  locality: default_locality,
  :password => 'password',
  role: teacher_role
)
student1 = Person.create!(
  gender: 'Homme',
  first_name: 'Yann',
  last_name: 'Menoud',
  birth_date: DateTime.new(1970,1,1),
  address: '123 Rue Principale',
  phone_number: '+41794567890',
  email: 'menoudy@eduvaud.ch',
  locality: default_locality,
  :password => 'password',
  role: student_role
)
student2 = Person.create!(
  gender: 'Homme',
  first_name: 'Luis Pedro',
  last_name: 'Pinheiro',
  birth_date: DateTime.new(1970,1,1),
  address: '123 Rue Principale',
  phone_number: '+41794567890',
  email: 'pinheirop@eduvaud.ch',
  locality: default_locality,
  :password => 'password',
  role: student_role
)
student3 = Person.create!(
  gender: 'Homme',
  first_name: 'Noah',
  last_name: 'Barberini',
  birth_date: DateTime.new(1970,1,1),
  address: '123 Rue Principale',
  phone_number: '+41794567890',
  email: 'barberinin@eduvaud.ch',
  locality: default_locality,
  :password => 'password',
  role: student_role
)

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
  { name: "Géographie", is_archived: true }
]
courses.each do |course|
  Course.create!(name: course[:name], is_archived: course[:is_archived])
end

# Seed exams table with 20 exams
first_course_id = Course.first.id
last_course_id = Course.last.id
first_semester_id = Semester.first.id
last_semester_id = Semester.last.id
Exam.create!(date: DateTime.now + 1.days, title: "Introduction à la Physique Quantique", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 2.days, title: "Accords des Participes Passés", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 3.days, title: "Théorèmes Fondamentaux en Calcul", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 4.days, title: "Histoire de l'Art Moderne", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 5.days, title: "Biologie Cellulaire Avancée", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 6.days, title: "Introduction à la Psychologie Cognitive", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 7.days, title: "Économie Politique et Mondialisation", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 8.days, title: "Principes de la Chimie Organique", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 9.days, title: "Fondements de l'Ingénierie Mécanique", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 10.days, title: "Analyse Littéraire Contemporaine", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 11.days, title: "Structures Algébriques en Mathématiques", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 12.days, title: "Dynamiques des Systèmes Écologiques", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 13.days, title: "Anthropologie Culturelle", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 14.days, title: "Physiologie Humaine et Anatomie", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 15.days, title: "Programmation Informatique Avancée", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 16.days, title: "Géopolitique Contemporaine", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 17.days, title: "Études de la Renaissance Européenne", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 18.days, title: "Philosophie de la Science", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 19.days, title: "Sociologie des Médias", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))
Exam.create!(date: DateTime.now + 20.days, title: "Techniques Avancées en Photographie", coefficient: [1, 1.5, 2].sample, course_id: rand(first_course_id..last_course_id), semester_id: rand(first_semester_id..last_semester_id))


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

# Seed grades table with 10 grades
Grade.create!(person_id: 5, exam_id: 1, grade: 5.0)
Grade.create!(person_id: 5, exam_id: 2, grade: 4.0)
Grade.create!(person_id: 6, exam_id: 3, grade: 5.5)
Grade.create!(person_id: 6, exam_id: 4, grade: 5.5)
Grade.create!(person_id: 7, exam_id: 5, grade: 5.0)
Grade.create!(person_id: 7, exam_id: 6, grade: 2.0)
Grade.create!(person_id: 5, exam_id: 7, grade: 2.5)
Grade.create!(person_id: 6, exam_id: 8, grade: 4.0)
Grade.create!(person_id: 7, exam_id: 9, grade: 4.5)

# Seed classrooms table with 10 classrooms
classrooms = [
  { name: "SI-T1a", promotion_start_date: DateTime.new(2024, 9, 1), promotion_end_date: DateTime.new(2025, 6, 30) },
  { name: "SI-T2a", promotion_start_date: DateTime.new(2024, 9, 1), promotion_end_date: DateTime.new(2025, 6, 30) },
  { name: "SI-T1b", promotion_start_date: DateTime.new(2024, 9, 1), promotion_end_date: DateTime.new(2025, 6, 30) },
  { name: "SI-T2b", promotion_start_date: DateTime.new(2024, 9, 1), promotion_end_date: DateTime.new(2025, 6, 30) },
]
classrooms.each do |classroom|
  Classroom.create!(name: classroom[:name], promotion_start_date: classroom[:promotion_start_date], promotion_end_date: classroom[:promotion_end_date])
end

# Seed placements table with 10 placements
Placement.create!(person_id: 1, classroom_id: 1)
Placement.create!(person_id: 2, classroom_id: 2)
Placement.create!(person_id: 3, classroom_id: 3)
Placement.create!(person_id: 4, classroom_id: 4)
Placement.create!(person_id: 4, classroom_id: 1)
Placement.create!(person_id: 3, classroom_id: 2)
Placement.create!(person_id: 2, classroom_id: 3)
Placement.create!(person_id: 5, classroom_id: 1)
Placement.create!(person_id: 6, classroom_id: 2)
Placement.create!(person_id: 7, classroom_id: 3)

# Seed enrollments table with 6 enrollments
Enrollment.create!(classroom_id: 1, course_id: 1)
Enrollment.create!(classroom_id: 2, course_id: 2)
Enrollment.create!(classroom_id: 3, course_id: 3)
Enrollment.create!(classroom_id: 4, course_id: 4)
Enrollment.create!(classroom_id: 1, course_id: 5)
Enrollment.create!(classroom_id: 2, course_id: 6)
Enrollment.create!(classroom_id: 3, course_id: 7)
Enrollment.create!(classroom_id: 4, course_id: 8)

# Same situation as the exams_semesters table, I should have created an ExamCourse model
ActiveRecord::Base.connection.execute("
  INSERT INTO courses_semesters (course_id, semester_id) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 1),
  (6, 2),
  (7, 3),
  (8, 4),
  (9, 1),
  (10, 2),
  (1, 3),
  (2, 4),
  (3, 1),
  (4, 2),
  (5, 3),
  (6, 4),
  (7, 1),
  (8, 2),
  (9, 3),
  (10, 4)
")
