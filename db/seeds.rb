u = User.new(:email => "admin", :password => "choochoo")
u.save(false) # bypass validation
g = u.groups.create(:name => "The First Group", :keyword => "1stgroup")
b = u.boards.create(:name => "The First Board", :keyword => "1stboard", :group_id => g.id)