include LetterAvatar::AvatarHelper

module ApplicationHelper

  def full_title(page_title)
  	base_title = "FCSQ"
  	if page_title.empty?
  	  base_title
  	else
  	  "#{base_title} | #{page_title}"
  	end
  end

  def alert_message(value)
  	"\"#{value}\""
  end

end
