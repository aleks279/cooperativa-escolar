class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[wall]
  before_action :find_article, except: %i[index new create wall]

  def index
    @articles = Article.all
  end

  def wall
    @articles = Article.where(published: true)
  end

  def show; end

  def new
    @article = Article.new
    @title = :new
  end

  def create
    @title = :new
    @article = Article.new(article_params)

    @article.user = current_user

    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @title = :edit
  end

  def update
    @title = :edit
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy if @article.present?
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(
      :title, :published, :user,
      sections_attributes: %i[
        id header body image_url _destroy
      ]
    )
  end
end
