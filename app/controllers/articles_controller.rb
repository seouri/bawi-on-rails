class ArticlesController < ApplicationController
  before_filter :set_board
  # GET /articles
  # GET /articles.xml
  def index
    redirect_to(board_path(@board))
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])
    @article.increment!(:hits_count) unless @article.user_id == current_user.id

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  def reply
    parent_article = Article.find(params[:id])
    title = ("Re: " + parent_article.title).gsub(/^(Re: )+/, "Re: ")
    body = "\n\n\n\n" + parent_article.author.email + " wrote: " + parent_article.body.split(/\n/).map {|line| "> " + line}.join("\n")
    @article = @board.articles.new(:parent_no => parent_article.article_no, :thread_no => parent_article.thread_no, :title => title, :body => body)

    respond_to do |format|
      format.html { render :action => "new" }
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = @board.articles.new(params[:article])
    @article.user_id = current_user

    respond_to do |format|
      if @article.save
        format.html { redirect_to(board_article_path(@board, @article), :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(board_article_path(@board, @article), :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(board_path(@board)) }
      format.xml  { head :ok }
    end
  end

  def thread
    article = Article.find(params[:id])
    @articles = @board.articles.where(:thread_no => article.thread_no)
    @articles.each {|a| a.increment!(:hits_count) unless a.user_id == current_user.id}

    respond_to do |format|
      format.html
      format.xml  { render :xml => @article }
    end
  end

  private

  def set_board
    @board = Board.find(params[:board_id], :include => [:group, :articles])
    @article_list = @board.articles.paginate(:page => params[:page], :per_page => 5, :order => "id desc")
  end
end
