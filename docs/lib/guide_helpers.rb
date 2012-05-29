module GuideHelpers
  def page_title
    title = "Susy: "
    if data.page.title
      title << data.page.title
    else
      title << "Responsive grids for Compass"
    end
    title
  end

  def page_side_content
    side_content = false
    if data.page.side_content
      side_content = data.page.side_content
    end
    side_content
  end
end
