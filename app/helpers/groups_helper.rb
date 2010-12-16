module GroupsHelper
  def groups(groups)
    li = []
    groups.each do |group|
      li.push(content_tag(:li, link_to(group.name, group), :id => dom_id(group), :class => dom_class(group)))
    end
    content_tag(:ul, li.join("\n").html_safe, :id => "groups")
  end
end
