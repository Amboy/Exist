
module CommentsHelper

  def commentbody(comment)
    unless(comment.new_record?)
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
	
        <table>
	<br>
    }
    end	
  end
end
