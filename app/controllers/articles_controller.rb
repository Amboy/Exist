class ArticlesController < ApplicationController
  before_filter :require_author, :except => [:latest, :show, :print]

  def index
    @articles = Article.all
    respond_to do |format|
      	format.html # index.html.erb
        format.xml { render :xml => @articles }
    end	
  end

  def latest
    @article = Article.latest.first
    @comment = Comment.new(:article_id => @article.id)

  end

  def show
    @article = Article.find(params[:id])
    @comment  = @article.comments.build
    render :action => "latest"
  end

  def print
    @article = Article.find(params[:id])
    render :layout => "print"
  end

  def new
    @article = Article.new
    @article.author = current_author
  end

  def edit
       @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(params["article"])    
    if @article.save 
      redirect_to @article
    else 
      render :action=> 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article
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
