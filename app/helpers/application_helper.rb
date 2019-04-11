module ApplicationHelper

	#returns full page title
	def full_title(title)
		page_title = "Odin Facebook"
		unless title.empty?
			"#{title} | #{page_title}"
		else
			page_title
		end
	end
end
