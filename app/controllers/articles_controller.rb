class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy, :edit, :update]
  # This runs the set_article method before show,
  # destroy and edit, as specified by the only: key.
  # With this, @article is available within the scopes of the show,
  # destroy and edit actions. We can now remove the lines in show,
  # destroy and edit that set @article

  ###

#  F L A S H MESSAGES    :D

  # The controller provides you with accessor methods to
  # interact with the flash object.
  # Calling flash.notice will fetch a value,
  #  and flash.notice = "Your Message" will store the string
  #  into it.

            ###

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
    @article.save
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(article_params)
     flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end

  private

  def set_article
   @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end


end
