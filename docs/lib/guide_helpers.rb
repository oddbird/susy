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
    side_content = "
                   <h2>Contribute</h2>
                   <ul>
                     <li><a href='https://github.com/ericam/susy'>Fork on GitHub</a></li>
                     <li><a href='https://github.com/ericam/susy/zipball/master'>Download</a></li>
                     <li><a href='http://twitter.com/compasssusy/'>Follow on Twitter</a></li>
                   </ul>
                   "
    if data.page.side_content
      side_content = data.page.side_content
    end
    side_content
  end
end
