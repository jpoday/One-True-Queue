module ApplicationHelper
  def title(page_title, h1 = nil, show_title = true)
    base_title = "One True Queue"
    if page_title
      content_for(:title) { "#{h(page_title.to_s)} | #{base_title}" }
    else
      content_for(:title) { base_title }
    end
    if h1
      content_for(:short_title) { h(h1.to_s) }
    else
      content_for(:short_title) { h(page_title.to_s) }
    end
    @show_title = show_title
  end

  def show_title?
    @show_title
  end
  
  def logo
    logo = image_tag("projector3.png", :size => "120x90", :alt => "One True Queue", :class => "headerimg")
  end
end
