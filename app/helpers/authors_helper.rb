module AuthorsHelper
  def say_hello(author)
    "Hello #{author.full_name}"
  end
  def author_list(author)
  <<-STR
  <table>
    <tr>
      <th>Name</th>
      <td class="data">#{author.full_name}</td>
    </tr>
    <tr>
      <th>Birthday</th>
      <td class="data">#{author.birthday}</td>
    </tr>
    <tr>
       <th>Articles</th>
       <td class="data">#{str=""
               author.articles.each do |i| 
                 str << "#{link_to i.title, article_path(i)} <br>" 
               end 
             str}
      </td>
    </tr>
    <tr>
       <td colspan="2">
          #{link_to "Edit", edit_author_path(author)} 
          #{link_to "Show", author} 
 	  #{link_to "delete", author, :confirm => "Confirm delete? \"#{author.full_name}\"", :method => :delete}
       </td>
    </tr>
  </table>
    STR
  end
end
