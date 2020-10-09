class ArticlesController < ApplicationController
  http_basic_authenticate_with :name => "Ajay", :password => "Ajay@123", :except => [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    # @article = Article.find(params[:id])
    @comment=Comment.new(article: @article)
    @articles = Article.all()
    @comments =
    respond_to do |format|
    format.html  # index.html.erb
    format.json  { render :json => @articles }
    format.atom
  end

  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    #@comment = Article.comment
    #@comment.article_id = @article.id

   @article = Article.find(params[:id])
    #@comment = @article.comments.build
  respond_to do |format|
    format.html  # show.html.erb
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
      params.require(:article).permit(:name, :title, :content,:comment)
    end
end
