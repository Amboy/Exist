class LikesController < ApplicationController
  def ilike
    @article = Article.find(params[:article_id])
    @like = Like.create(:author => current_author, :article => @article)
    render :partial => "like", :locals =>{:article => @article, :like => @like}
  end
  def unlike
    @article = Article.find(params[:article_id])
    @like = Like.find(params[:id])
    @like.destroy
    render :partial => "like", :locals =>{:article => @article}
  end
end
