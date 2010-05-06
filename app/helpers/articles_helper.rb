module ArticlesHelper
  def view_article(article)
    %Q{
      <table>
        <tr>
          <th>Title: </th>
          <td>#{article.title}</td>
        </tr>
        <tr>
          <th>Author: </th>
          <td>#{Author.find(article.author_id).full_name}</td>
        </tr>
        <tr>
          <th>Body: </th>
        </tr>
        <tr>
        <td>#{article.body}</td>
        </tr>
      </table>
    }
  end
  def view_legend
    %Q{
     <table style="float:right; text-align: center">
       <tr>
         <td style="width: 10px; background-color: 	#B7410E"> </td>
         <td>Draft</td>
         <td> </td>
         <td style="width: 10px; background-color: #E0115F"> </td>
         <td>Posted</td>
       </tr>
     </table>

     <br />
    }
  end
  def list_all(article, status, author)
    %Q{
      <table class="all">
        <tr class = #{status}>
          <th class="Labels">Title: </th>
          <td> #{link_to article.title, article} </td>
        </tr>

        <tr class = #{status}>
          <th class="Labels">Author: </th>
          <td>#{link_to author.full_name, author_path(author)}</td>
        </tr>

        <tr class = #{status}>
          <th class="Labels">Actions:</th>
          <td >
            <ul class="nobullets">
              <li> #{link_to "Edit", edit_article_path(article) if !article.is_posted? }</li>
              <li> #{link_to "Delete", article, :confirm => "Confirm delete? \'#{article.title}\'", :method => :delete}</li>
            </ul>
          </td>
        </tr>

        <tr><td colspan=2><hr /></td></tr>
      </table>

      <br />
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
              <li>#{link_to "Print Document", print_article_path(article)}</li>
              <li>#{link_to "Delete", article, :confirm => "Confirm delete? \'#{article.title}\'", :method => :delete}</li>
            </ul>
          </td>
          <td>
            <ul class="nobullets">
              <li>#{link_to "Back to Author index", authors_path} </li>
              <li>#{link_to "Back to Article index", articles_path} </li>
            </ul>
          </td>
        </tr>
      </table>
    }
  end
end
