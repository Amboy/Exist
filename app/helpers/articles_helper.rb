module ArticlesHelper
  def view_legend
    %Q{
      <tr>
        <td style="width: 10px; background-color: 	#B7410E"> </td>
        <td>Draft</td>
        <td> </td>
        <td style="width: 10px; background-color: #E0115F"> </td>
        <td>Posted</td>
    </tr>
    }
  end
  def view_comments(article)
    %Q{
      <p>Comments: </p>
      <div class='blog-comments'>
        #{article.comments.map{|c| comment_body(c)}.to_s }
      </div>
      }
  end
  
  def article_actions(article)
    %Q{
      <table>
        <tr>
          <td class="Labels">Actions: </td>
          <td>
            <ul class="nobullets">
              <li>#{link_to "Delete", article, :confirm => "Confirm delete? \'#{article.title}\'", :method => :delete} </li>
              <li>#{link_to "Print Document", print_article_path(article)}</li>
              <li>#{link_to "Back to Author index", authors_path} </li>
              <li>#{link_to "Back to Article index", articles_path} </li>
            </ul>
          </td>
        </tr>
      </table>
    }
  end
end
