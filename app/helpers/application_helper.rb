module ApplicationHelper
  def display_flash_messages
    flash_tags = ([:alert, :info, :notice, :error, :success] & flash.keys)
    output = ""
    flash_tags.each do |tag|
      if tag == :alert
        output << "<script>alert('#{flash[tag]}');</script>"
      else  
        output << content_tag(:div, content_tag(:p, flash[tag], :class => "icon"), :id => "notice", :class => "flash #{tag.to_s}")
      end  
    end 
    return output.html_safe
  end
  
  def tabs(*args)
    content_tag(:ul, args.map{ |a| content_tag(:li, (a.last.include?('<a') ? a.last : link_to(a.first, a.last))) }.join("").html_safe)
  end
  
end
