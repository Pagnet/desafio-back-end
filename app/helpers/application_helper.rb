module ApplicationHelper
	def exibir_flash
		msgs = []
		flash.each do |type, msg|
			msgs << content_tag(:div, class: "alert alert-info") do
				msg
			end
		end
		raw(msgs.join(""))
	end
end
