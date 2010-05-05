module AuthorsHelper
  def say_hello(author)
    "Hello #{author.full_name}"
  end
  def author_info(author)
    %Q{
      <tr>
        <th class="Labels">Name</th>
        <td class="data">#{author.full_name}</td>
      </tr>
      <tr>
        <th class="Labels">Birthday</th>
        <td class="data">#{author.birthday.strftime("%B %d, %Y")}</td>
      </tr>
      <tr>
        <th class="Labels">Email Address:</th>
        <td class="data">#{author.email}</td>
      </tr>
     }
  end

  def author_articles(author)
    %Q{
       <tr>
         <th class="Labels">Articles:</th>
         <td>
           <ul class="nobullets">
             #{ m = String.new
                author.articles.each do |i|
                  m << "<li> #{link_to i.title, article_path(i)} <br /> </li>"
                end
                m
              }
	         </ul>
        </td>
       </tr>
      }
  end

  def author_actions(author, action)
    %Q{
       <tr><td colspan=2><hr /></td></tr>
       <tr class="posted">
         <th class="Labels"> Actions: </th>
         <td>
           <ul class="nobullets">
             <li> #{link_to 'Create new Article', new_article_path} </li>
             <li> #{link_to 'Edit', edit_author_path(author)} </li>
             <li> #{action == 'edit' ? (link_to 'Show', author) : (link_to 'Back to Index', authors_path)} </li>
           </ul>
         </td>
         <td>
           #{link_to 'Delete Author', author, :confirm => 'Delete Your own Account? ', :method => :delete}
         </td>
       </tr>
     }
  end
    
end
