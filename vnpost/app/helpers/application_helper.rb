module ApplicationHelper

	def title(*parts)
		unless parts.empty?
			content_for :title do
			(parts << "Ticketee").join(" - ")
			end
		end
	end

	def admins_only(&block)
		block.call if current_user.try(:admin?)
	end

	def nhanviens_only(&block)
		block.call if current_user.try(:nhanvien?)
	end

	include Rails.application.routes.url_helpers

	    def cancel_link
	      return link_to 'Trở về', request.env["HTTP_REFERER"], 
	        :class => 'cancel', 
	        :confirm => 'Bạn có chắc chắn không? Dữ liệu thay đổi sẽ bị mất.'
	    end

end
