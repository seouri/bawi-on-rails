module GroupsHelper
  def groups(groups)
    li = []
    groups.each do |group|
      li.push(content_tag(:li, link_to(group.name, group), :id => dom_id(group), :class => dom_class(group)))
    end
    content_tag(:ul, li.join("\n").html_safe, :id => "groups")
  end

  def path(group)
    path = [link_to("Home", groups_path)]
    group.ancestors.each {|g| path.push(link_to(g.name, g))}
    path.push(link_to(group.name, group))
    path.push(link_to(@board.name, @board)) unless @board.nil?
    content_tag(:div, path.join(" &gt; ").html_safe, :id => "path")
  end
end
