class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
     @article = Article.find(params[:id])

  end
  def create
    @article = Article.create(params[:author])
    if @article.save 
	redirect_to @article
    else 
	render :action=> 'new'
    end
  end
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:author])
      redirect_to @author
    else
      render :action=>'edit'  
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to(articles_url)
  end

end
