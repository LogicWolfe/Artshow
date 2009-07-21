# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #
  # Ensure the Default Artist exists
  # 
  def artist 
     @artist = ArtistController.init
  end
  def modalbox(title,width=600,height=500,f="")
    {:title =>  title ,:onclick => "this.blur();Modalbox.show(this.href, {title: this.title, width: #{width},height:#{height}});#{f};return false;"}
  end
  def my_text_field_with_auto_complete(object, method, tag_options = {}, completion_options = {})
     if(tag_options[:index])
       tag_name = "#{object}_#{tag_options[:index]}_#{method}"
     else
       tag_name = "#{object}_#{method}"
     end

     (completion_options[:skip_style] ? "" : auto_complete_stylesheet) +
         text_field(object, method, tag_options) +
         content_tag("div", "", :id => tag_name + "_auto_complete", :class => "auto_complete") +
         auto_complete_field(tag_name, { :url => { :action => "auto_complete_with_index_for_#{object}_#{method}" } }.update(completion_options))
   end
end
