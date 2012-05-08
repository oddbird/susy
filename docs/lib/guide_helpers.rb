module GuideHelpers
  def page_title
    title = "Susy: "
    if data.page.title
      title << data.page.title
    else
      title << "The Un-obstruive, Responsive Grid for Designers"
    end
    title
  end
end
