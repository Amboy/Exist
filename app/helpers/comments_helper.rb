
module CommentsHelper

  def comment_body(comment)

    puts "...........................Hello"
    puts comment.inspect
    puts "World..........................."
    return " " if comment.new_record?
    %Q{
	     <table>
         <tr>
		       <th class="email">email address: </th>
		       <td class="email">#{comment.email}</th>
	       </tr>
         <tr>
		       <th>Time Posted: </th>
		       <td>#{comment.created_at.strftime("%B %d, %Y , %H:%M")}</th>
	       </tr>
	       <tr>
		       <th>Comment:</th>
		       <td class="comment">#{comment.body}</td>
	       </tr>
	     <br />
       <table>
      }
  end
  def post_comment(f)
    %Q{
       <table style="width:100%">
         <tr>
           <td class="Labels">
             #{f.label :email}
           </td>
           <td>
             #{f.text_field :email}
           </td>
         </tr>
         <tr>
           <td class="Labels">
             #{f.label :body}
           </td>
         </tr>
         <tr>
           <td colspan="2">
             #{f.text_area :body, :rows => 6}
           </td>
         </tr>
      </table>
    }
  end
end
