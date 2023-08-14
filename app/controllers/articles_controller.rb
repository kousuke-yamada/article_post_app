class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit,  :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "記事を新規作成しました。"
      redirect_to users_articles_url
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "記事を編集しました。"
      redirect_to users_articles_url
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "記事：#{@article.title} を削除しました。"
    redirect_to users_articles_url
  end

  private
    def article_params
      params.require(:article).permit(:title, :content, :image, :image_cache)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
