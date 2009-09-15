module AlimentsHelper

	@@savors = %w{sauer bitter suess scharf salzig}
	@@elements = %w{wood fire earth metal water}
	@@temperatures = %w{hot warm neutral cool cold}

	def savor_for(aliment)
		element = @@elements[aliment.savor]
		text = t('aliment.' + @@savors[aliment.savor]) + ', ' + t('aliment.' + element)
		content_tag(:div, :class => {'element ', element}) do
			if aliment.savor_tendence
				text + ' &darr;' + content_tag(:span, t('aliment.' + @@savors[aliment.savor_tendence]), :class => 'tendence')
			else
				text
			end
		end
	end

	def temperature_for(aliment)
		temperature = @@temperatures[aliment.temperature] 
		text = t('aliment.' + temperature)
		content_tag(:div, text, :class => {'element ', temperature})
		content_tag(:div, :class => {'element ', temperature}) do
			if aliment.temperature_tendence
				text + ' &darr;' + content_tag(:span, t('aliment.' + @@temperatures[aliment.temperature_tendence]), :class => 'tendence')
			else
				text
			end
		end
	end

	def wikipedia_link_for(aliment)
		link_to(t('aliment.wikipedia', :aliment => aliment.name), 'http://' + I18n.locale + '.wikipedia.org/wiki/' + aliment.name, :popup => true, :class => 'external')
	end

	def savor_select(with_blank, tendence=false)
		i = -1
		attr = :savor
		attr = :savor_tendence if tendence
		select(:aliment, attr, @@savors.collect do |s| 
				i = i.next
			  [t(s, :scope => 'aliment'), i]
		  end, {:include_blank => with_blank}
		)
	end

	def temperature_select(with_blank, tendence=false)
		i = -1
		attr = :temperature
		attr = :temperature_tendence if tendence
		select(:aliment, attr, @@temperatures.collect do |s| 
				i = i.next
			  [t(s, :scope => 'aliment'), i]
		  end, {:include_blank => with_blank}
		)
	end

  def fix_cc_links(attribution)
    attribution.gsub(/href/im, "target='_cc' href").gsub!(/">CC/im, "deed.#{I18n.locale}\">CC")
  end
  
end
