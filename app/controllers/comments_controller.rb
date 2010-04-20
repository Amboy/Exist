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
      redirect_to article_path(@article)
    else
      flash[:notice] = "fail to post comment."
    render :template => "articles/latest"
    end
      
  end
end
