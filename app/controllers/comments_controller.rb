class CommentsController < ApplicationController
  def create
     @article = Article.find params[:article_id]
     @article.comments.new comment_params
     @article.save
  end
 private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
 def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    @article.save
  end
end
