class CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    board = Board.find(params[:board_id])
    @comment = article.comments.new(params[:comment])
    @comment.board_id = article.board.id
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(board_article_path(board, article), :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    board = @comment.board
    article = @comment.article
    @comment.destroy if @comment.user_id == current_user.id

    respond_to do |format|
      format.html { redirect_to(board_article_path(board, article), :notice => 'Comment was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
end
