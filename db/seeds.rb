# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Специальности

sp1 = Specialty.create(dtype: '0', human_dtype: 'Направление', direction: 'Информатика и вычислительная техника', level: '0', human_level: 'Бакалавриат', study_form: '0', human_study_form: 'очная')
sp2 = Specialty.create(dtype: '0', human_dtype: 'Направление', direction: 'Информатика и вычислительная техника', level: '1', human_level: 'Магистратура', study_form: '0', human_study_form: 'очная')
sp3 = Specialty.create(dtype: '0', human_dtype: 'Направление', direction: 'Информационные системы и технологии', level: '0', human_level: 'Бакалавриат', study_form: '0', human_study_form: 'очная')
sp4 = Specialty.create(dtype: '1', human_dtype: 'Специальность', direction: 'Ядерные реакторы и материалы', level: '2', human_level: 'Специалитет', study_form: '0', human_study_form: 'очная')
sp5 = Specialty.create(dtype: '0', human_dtype: 'Направление', direction: 'Теплофизика ядерных энергетических установок', level: '1', human_level: 'Магистратура', study_form: '0', human_study_form: 'очная')
sp6 = Specialty.create(dtype: '0', human_dtype: 'Направление', direction: 'Высокопроизводительные компьютерные системы и технологии', level: '0', human_level: 'Бакалавриат', study_form: '1', human_study_form: 'очно-заочная')
sp6 = Specialty.create(dtype: '1', human_dtype: 'Специальность', direction: 'Электроника физических установок', level: '2', human_level: 'Специалитет', study_form: '1', human_study_form: 'очно-заочная')

#Дисциплины

ds1 = Discipline.create(name: 'Иностранный язык', label: 'ГМ')
ds2 = Discipline.create(name: 'История', label: 'ГМ')
ds3 = Discipline.create(name: 'Философия', label: 'ГМ')
ds4 = Discipline.create(name: 'Физика', label: 'ЕНМ')
ds5 = Discipline.create(name: 'Аналитическая геометрия', label: 'ЕНМ')
ds6 = Discipline.create(name: 'Операционные системы', label: 'ОПМ')
ds7 = Discipline.create(name: 'Электротехника', label: 'ОПМ')
ds8 = Discipline.create(name: 'Линейная алгебра', label: 'ЕНМ')
ds9 = Discipline.create(name: 'Базы данных', label: 'ОПМ')
ds10 = Discipline.create(name: 'Теория вероятностей и математическая статистика', label: 'ОПМ')
ds11 = Discipline.create(name: 'Низкоуровневое программирование', label: 'ОПМ')
ds12 = Discipline.create(name: 'Параллельные вычисления', label: 'ПМ')
ds13 = Discipline.create(name: 'Микропроцессорные устройства и системы', label: 'ОПМ')
ds14 = Discipline.create(name: 'Основы языков программирования C и C++', label: 'ОПМ')
ds15 = Discipline.create(name: 'Методы оптимизации', label: 'ОПМ')

# Связи 

link1_1_1 = LinkSpecialtyDiscipline.create(term: '1', htype: '3', human_htype: 'Зачет', specialty: sp1, discipline: ds1)
link1_1_2 = LinkSpecialtyDiscipline.create(term: '2', htype: '3', human_htype: 'Зачет', specialty: sp1, discipline: ds1)
link1_1_3 = LinkSpecialtyDiscipline.create(term: '3', htype: '3', human_htype: 'Зачет', specialty: sp1, discipline: ds1)
link1_1_4 = LinkSpecialtyDiscipline.create(term: '4', htype: '5', human_htype: 'Экзамен', specialty: sp1, discipline: ds1)

link1_2 = LinkSpecialtyDiscipline.create(term: '1', htype: '3', human_htype: 'Зачет', specialty: sp1, discipline: ds2)

link1_3 = LinkSpecialtyDiscipline.create(term: '3', htype: '3', human_htype: 'Зачет', specialty: sp1, discipline: ds3)

link1_4_1 = LinkSpecialtyDiscipline.create(term: '1', htype: '5', human_htype: 'Экзамен', specialty: sp1, discipline: ds4)
link1_4_2 = LinkSpecialtyDiscipline.create(term: '2', htype: '5', human_htype: 'Экзамен', specialty: sp1, discipline: ds4)
link1_4_3 = LinkSpecialtyDiscipline.create(term: '3', htype: '5', human_htype: 'Экзамен', specialty: sp1, discipline: ds4)
link1_4_4 = LinkSpecialtyDiscipline.create(term: '4', htype: '5', human_htype: 'Экзамен', specialty: sp1, discipline: ds4)

link1_5 = LinkSpecialtyDiscipline.create(term: '1', htype: '5', human_htype: 'Экзамен', specialty: sp1, discipline: ds5)

link1_6 = LinkSpecialtyDiscipline.create(term: '1', htype: '3', human_htype: 'Зачет', specialty: sp1, discipline: ds6)

link1_7 = LinkSpecialtyDiscipline.create(term: '5', htype: '5', human_htype: 'Экзамен', specialty: sp1, discipline: ds7)

link1_8 = LinkSpecialtyDiscipline.create(term: '2', htype: '5', human_htype: 'Экзамен', specialty: sp1, discipline: ds8)

link1_9 = LinkSpecialtyDiscipline.create(term: '5', htype: '3', human_htype: 'Зачет', specialty: sp1, discipline: ds9)

link1_10_1 = LinkSpecialtyDiscipline.create(term: '3', htype: '3', human_htype: 'Зачет', specialty: sp1, discipline: ds10)
link1_10_2 = LinkSpecialtyDiscipline.create(term: '4', htype: '5', human_htype: 'Экзамен', specialty: sp1, discipline: ds10)

link1_11 = LinkSpecialtyDiscipline.create(term: '6', htype: '3', human_htype: 'Зачет', specialty: sp1, discipline: ds11)

link1_12 = LinkSpecialtyDiscipline.create(term: '7', htype: '3', human_htype: 'Зачет', specialty: sp1, discipline: ds12)

link1_13 = LinkSpecialtyDiscipline.create(term: '8', htype: '5', human_htype: 'Экзамен', specialty: sp1, discipline: ds13)


link2_1_1 = LinkSpecialtyDiscipline.create(term: '1', htype: '3', human_htype: 'Зачет', specialty: sp3, discipline: ds1)
link2_1_2 = LinkSpecialtyDiscipline.create(term: '2', htype: '3', human_htype: 'Зачет', specialty: sp3, discipline: ds1)
link2_1_3 = LinkSpecialtyDiscipline.create(term: '3', htype: '3', human_htype: 'Зачет', specialty: sp3, discipline: ds1)
link2_1_4 = LinkSpecialtyDiscipline.create(term: '4', htype: '5', human_htype: 'Экзамен', specialty: sp3, discipline: ds1)

link2_2 = LinkSpecialtyDiscipline.create(term: '1', htype: '3', human_htype: 'Зачет', specialty: sp3, discipline: ds2)

link2_3 = LinkSpecialtyDiscipline.create(term: '4', htype: '3', human_htype: 'Зачет', specialty: sp3, discipline: ds3)

link2_4_1 = LinkSpecialtyDiscipline.create(term: '1', htype: '5', human_htype: 'Экзамен', specialty: sp3, discipline: ds4)
link2_4_2 = LinkSpecialtyDiscipline.create(term: '2', htype: '5', human_htype: 'Экзамен', specialty: sp3, discipline: ds4)
link2_4_3 = LinkSpecialtyDiscipline.create(term: '3', htype: '5', human_htype: 'Экзамен', specialty: sp3, discipline: ds4)
link2_4_4 = LinkSpecialtyDiscipline.create(term: '4', htype: '5', human_htype: 'Экзамен', specialty: sp3, discipline: ds4)

link2_5 = LinkSpecialtyDiscipline.create(term: '1', htype: '5', human_htype: 'Экзамен', specialty: sp3, discipline: ds5)

link2_6 = LinkSpecialtyDiscipline.create(term: '1', htype: '3', human_htype: 'Зачет', specialty: sp3, discipline: ds6)

link2_8 = LinkSpecialtyDiscipline.create(term: '3', htype: '5', human_htype: 'Экзамен', specialty: sp3, discipline: ds8)

link2_9_1 = LinkSpecialtyDiscipline.create(term: '5', htype: '3', human_htype: 'Зачет', specialty: sp3, discipline: ds9)
link2_9_2 = LinkSpecialtyDiscipline.create(term: '6', htype: '5', human_htype: 'Экзамен', specialty: sp3, discipline: ds9)

link2_10 = LinkSpecialtyDiscipline.create(term: '3', htype: '5', human_htype: 'Экзамен', specialty: sp3, discipline: ds10)

link2_12 = LinkSpecialtyDiscipline.create(term: '8', htype: '5', human_htype: 'Экзамен', specialty: sp3, discipline: ds12)

link2_14 = LinkSpecialtyDiscipline.create(term: '2', htype: '3', human_htype: 'Зачет', specialty: sp3, discipline: ds14)
link2_14 = LinkSpecialtyDiscipline.create(term: '3', htype: '5', human_htype: 'Экзамен', specialty: sp3, discipline: ds14)

link2_15 = LinkSpecialtyDiscipline.create(term: '5', htype: '3', human_htype: 'Зачет', specialty: sp3, discipline: ds15)


