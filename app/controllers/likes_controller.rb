class LikesController < ApplicationController
  def ilike
    @article = Article.find(params[:article_id])
    @like = Like.create(:author => current_author, :article => @article) unless Like.find(:first, :conditions => {:author_id => current_author.id, :article_id => @article.id})
    
    render :partial => "like", :locals =>{:article => @article, :like => @like}
  end
  def unlike
    @article = Article.find(params[:article_id])
    @like = Like.find(params[:id])
    @like.destroy
    render :partial => "like", :locals =>{:article => @article}
  end
end
