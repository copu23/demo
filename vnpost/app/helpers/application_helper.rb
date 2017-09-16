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

include Rails.application.routes.url_helpers

    def cancel_link
      return link_to 'Cancel', request.env["HTTP_REFERER"], 
        :class => 'cancel', 
        :confirm => 'Are you sure? Any changes will be lost.'
    end

end
