module ApplicationHelper
	def fix_url(str)
		str.starts_with?("http://") ? str : "http://#{str}"
  	end

  	def display_datetime(dt)
  		dt.strftime("%m/%d/%Y 1:%M%P")
  	end
end