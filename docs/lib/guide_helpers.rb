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
                   </ul>
                   <a href='https://twitter.com/compasssusy' class='twitter-follow-button' data-show-count='true'>Follow @compasssusy</a>
                    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src='//platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','twitter-wjs');</script>
                   "
    if data.page.side_content
      side_content = data.page.side_content
    end
    side_content
  end
end
