module ArticlesHelper
  def articles(articles)
    li = []
    articles.each do |article|
      article_no = link_to(article.article_no, board_article_path(@board, article), :class => "article_no")
      li.push(content_tag(:li, article_no + link_to(article.title, board_article_path(@board, article), :class => "title"), :id => dom_id(article), :class => dom_class(article)))
    end
    article_list = content_tag(:ul, li.join("\n").html_safe, :id => "articles")
    article_list + bottom_control
  end

  def bottom_control
    li = []
    li.push(link_to('Settings', edit_board_path(@board), :class => "button")) if @board.user_id == current_user.id
    li.push(link_to('Write', new_board_article_path(@board), :class => "button" ))
    content_tag(:ul, li.join("\n").html_safe, :class => "buttons")
  end
end
