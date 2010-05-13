class CommentsController < ApplicationController

  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:id])
    render :template => "articles/latest"
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "comment was successfully posted."      
      render :partial => "articles/update"
    else
      flash[:notice] = "fail to post comment."
      render :template => "articles/latest"
    end    
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete_this_comment(params[:author_id])
    redirect_to article_comments_path(@comment.article_id)
  end
  
end
