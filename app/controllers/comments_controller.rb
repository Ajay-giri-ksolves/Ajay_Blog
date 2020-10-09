class CommentsController < ApplicationController
  http_basic_authenticate_with :name => "Ajay", :password => "Ajay@123"
  def create
     @article = Article.find params[:article_id]
     @article.comments.new comment_params
     @article.save
  end
 private
    def comment_params
      params.require(:comment).permit(:commenter, :body,:user_id)
    end
 def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
end
