module LinkSpecialtyDisciplinesHelper
	def specialty_options(selected)
		options_for_select(Specialty.all.map{ |sp| ["#{sp.spec_id} #{sp.spec_name} #{sp.spec_type} #{sp.spec_mode} ", sp.id] }, selected)
	end

	def discipline_options(selected)
		options_for_select(Discipline.all.map{ |ds| ["#{ds.dis_name} #{ds.dis_module} #", ds.id] }, selected)
	end

end
