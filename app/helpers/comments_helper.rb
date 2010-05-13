
module CommentsHelper

  def comment_body(comment)

    return " " if comment.new_record?

    %Q{      
         <br />
         <table id=body#{comment.id}>
           <tr>
             <th class="email">email address: </th>
             <td class="email">#{comment.email}</td>
           </tr>
           <tr>
             <th>Time Posted: </th>
             <td>#{comment.created_at.strftime("%B %d, %Y , %H:%M")}</td>
           </tr>
           <tr>
             <th>Comment:</th>
             <td class="comment">#{comment.body}</td>
           </tr>         
         </table>
         
         <a id = link#{comment.id} href="javascript:display('show', #{comment.id})"> Hide this Comment </a>
        <br />
      }
  end
  def post_new_comment(f)
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
