module ApplicationHelper
  # Returns the full title on a per-page basis
  def page_title_generator(page_title = '')
    base_title = 'Twitter Clone'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
end
