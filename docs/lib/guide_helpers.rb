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
  
  def page_side_content
    side_content = "<ul>
                       <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
                       <li>Aliquam tincidunt mauris eu risus.</li>
                       <li>Vestibulum auctor dapibus neque.</li>
                    </ul>"
    if data.page.side_content
      side_content = data.page.side_content
    end
    side_content
  end
end
