# class ArticlesController < ApplicationController
#   def index
#     @articles = Article.all
#   end

#   def show
#     @articles = Article.find(params[:id])
#   end

#   def new
#     @articles = Article.new
#   end

#   def destroy
#     @articles = Article.find(params[:id])
#     @articles.destroy
#     redirect_to articles_path
#   end

#   def create
#     @article = Article.new(article_params)

#     if @article.save
#       redirect_to articles_path, notice: 'La tâche a été créée avec succès.'
#     else
#       render :new
#     end
#   end

#   def edit
#     @articles = Article.find(params[:id])
#   end

#   def update
#     @article = Article.find(params[:id])
#     if @article.update(article_params)
#       redirect_to @articles, notice: 'La tâche a été mise à jour avec succès.'
#     else
#       render :edit
#     end
#   end

#   private

#   def article_params
#     params.require(:article).permit(:title, :content)
#   end
# end
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end
  def show
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'Article was successfully destroyed.'
  end
  private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
