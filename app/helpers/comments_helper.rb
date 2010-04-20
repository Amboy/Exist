
module CommentsHelper

  def commentbody(comment)
    %Q{
	<table>
           <tr>
		<th class="email">email address: </th>
		<td class="email">#{comment.email}</th>
	   </tr>
           <tr>
		<th>Time posted: </th>
		<td>#{comment.created_at}</th>
	   </tr>
	   <tr>
		<th>comment:</th>
		<td class="comment">#{comment.body}</td>
	   </tr>
	
        <table>
	<br>
    }
  end
end
