module LinkSpecialtyDisciplinesHelper
	def specialty_options(selected)
		options_for_select(Specialty.all.map{ |sp| ["#{sp.human_dtype} #{sp.direction} #{sp.human_level} #{sp.human_study_form} ", sp.id] }, selected)
	end

	def discipline_options(selected)
		options_for_select(Discipline.all.map{ |ds| ["#{ds.name} #{ds.label}", ds.id] }, selected)
	end

end
