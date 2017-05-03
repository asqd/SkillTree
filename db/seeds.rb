# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

def create_records(json)
  size = json.size
  count = 0
  json.each do |rec|
    unless rec["code"] == "00.00.00" || rec["direction"] == "---------------" || rec["direction"].include?("подготовки:") || rec["profile"].blank?
      print "\r Creating record #{rec["id"]} | #{count+=1}/#{size}"
      rec['department_id'] = rec['department_number']
      s_cols = Specialty.column_names - ["id"]
      specialty = Specialty.find_or_create_by(rec.slice(*s_cols))
      rec["rows"].each do |row|
        row["courses"].each do |course|
          if course['label'].present? && course['label'].size > 8
            course['human_label'] = human_label(course['label'])
            course['department_id'] = course['department_number']
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

def create_saes(json)
  json.each do |rec|
    department_ids = rec["departments"].map { |r| r["id"] }
    Sae.create(name: rec["name"], departments: Department.where(id: department_ids))
  end
end

  def human_label(label)
    case
    when label.include?("-ГМ")
      "Гуманитарный"
    when label.include?("-ОНМ")
      "Общенаучный"
    when label.include?("-ОПМ")
      "Общепрофессиональный"
    when label.include?("-ПМ")
      "Профессиональный"
    when label.include?("-ЕНМ")
      "Естественнонаучный"
    when label.include?("-ИПМ")
      "Информационно-правовой"
    else
      "Другое"
    end
  end

departments_csv = open("#{Rails.root}/db/departments.csv").read
CSV.parse(departments_csv, col_sep: ";", headers: true).each do |row|
  Department.create(row.to_hash)
end

saes = "/db/saes.json"
json = JSON.parse(open("#{Rails.root}#{saes}").read)
create_saes(json)

courses_autumn = "/db/courses_autumn.json"
json = JSON.parse(open("#{Rails.root}#{courses_autumn}").read)
create_records(json)

courses_spring = "/db/courses_spring.json"
json = JSON.parse(open("#{Rails.root}#{courses_spring}").read)
create_records(json)