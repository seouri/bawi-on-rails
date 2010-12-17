module BoardsHelper
  def boards(boards)
    li = []
    boards.each do |board|
      li.push(content_tag(:li, link_to(board.name, board), :id => dom_id(board), :class => dom_class(board)))
    end
    content_tag(:ul, li.join("\n").html_safe, :id => "boards")
  end
end
