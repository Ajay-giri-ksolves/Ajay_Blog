class ArticlesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authenticate_user! ,only: [:new,:vote,:update]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    # @article = Article.find(params[:id])

    @comment=Comment.new(article: @article)
    @articles = Article.all()
    @articles = Article.includes(:user)
    respond_to do |format|
    format.html  # index.html.erb
    format.json  { render :json => @articles }
    format.atom
    @articles = Article.order(:name).page params[:page]

  end
end

  # GET /articles/1
  # GET /articles/1.json
  def show
   @article = Article.find(params[:id])
    #@comment = @article.comments.build
  respond_to do |format|
    format.html
    format.json  { render :json => @article }
  end

  end

  # GET /articles/new
  def new
    @article = Article.new
    respond_to do |format|
    format.html  # new.html.erb
    format.json  { render :json => @article }
  end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])

  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    @article.user_id = current_user.id
    # binding.pry
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
  def like
    @article = Article.find(params[:id])
    @article.liked_by current_user
    if request.xhr?
      format.js
      render json: { count: @article.get_likes.size, id: params[:id] }
    else
      redirect_to @article
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:name,:users_id, :title, :content,:comment,:image,:avatar,:comment_image)
    end

end
