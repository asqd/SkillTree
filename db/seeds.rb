# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fn = "/db/courses.json"
json = JSON.parse(open("#{Rails.root}#{fn}").read)

json.each do |rec|
  print "\r Creating record #{rec["id"]}"
  s_cols = Specialty.column_names
  specialty = Specialty.create(rec.slice(*s_cols))
  rec["rows"].each do |row|
    row["courses"].each do |course|
      d_cols = Discipline.column_names
      discipline = Discipline.create(course.slice(*d_cols))
      course["course_hours"].each do |hours|
        l_cols = LinkSpecialtyDiscipline.column_names
        hour = LinkSpecialtyDiscipline.create(hours.slice(*l_cols).merge({"specialty" => specialty, "discipline" => discipline}))
      end
    end
  end
end