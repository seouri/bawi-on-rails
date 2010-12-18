module ArticlesHelper
  def articles(articles)
    li = []
    articles.each do |article|
      article_no = link_to(article.article_no, board_article_path(@board, article), :class => "article_no")
      li.push(content_tag(:li, article_no + link_to(article.title, board_article_path(@board, article), :class => "title"), :id => dom_id(article), :class => dom_class(article)))
    end
    content_tag(:ul, li.join("\n").html_safe, :id => "articles")
  end
end
