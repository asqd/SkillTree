# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_records(json)
  json.each do |rec|
    unless rec["code"] == "00.00.00" || rec["direction"] == "---------------" || rec["direction"].include?("подготовки:")
      print "\r Creating record #{rec["id"]}"
      s_cols = Specialty.column_names - ["id"]
      specialty = Specialty.find_or_create_by(rec.slice(*s_cols))
      rec["rows"].each do |row|
        row["courses"].each do |course|
          if course['label'].present? && course['label'].size > 8
            d_cols = Discipline.column_names - ["id"]
            # discipline = Discipline.find_or_create(course.slice(*d_cols))
            discipline = Discipline.find_by(name: course["name"])
            discipline = Discipline.create(course.slice(*d_cols)) if discipline.blank?
            course["course_hours"].each do |hours|
              l_cols = LinkSpecialtyDiscipline.column_names - ["id"]
              hour = LinkSpecialtyDiscipline.find_by(hours.slice(*(l_cols - ["hours"])).merge({"specialty_id" => specialty.id, "discipline_id" => discipline.id}))
              hour = LinkSpecialtyDiscipline.create(hours.slice(*l_cols).merge({"specialty_id" => specialty.id, "discipline_id" => discipline.id})) if hour.blank?
            end
          end
        end
      end
    end
  end
end

courses_autumn = "/db/courses_autumn.json"
json = JSON.parse(open("#{Rails.root}#{courses_autumn}").read)
create_records(json)

courses_spring = "/db/courses_spring.json"
json = JSON.parse(open("#{Rails.root}#{courses_spring}").read)
create_records(json)

# csv_path = open("#{Rails.root}/db/departments.csv").read
# CSV.parse(csv_path, col_sep: ";", headers: true).each do |row|
#   Department.create(row)
# end