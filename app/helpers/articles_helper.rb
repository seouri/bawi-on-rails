module ArticlesHelper
  def articles(articles)
    li = []
    articles.each do |article|
      li.push(content_tag(:li, link_to(article.title, board_article_path(@board, article)), :id => dom_id(article), :class => dom_class(article)))
    end
    content_tag(:ul, li.join("\n").html_safe, :id => "articles")
  end
end
