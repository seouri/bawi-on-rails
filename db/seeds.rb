u = User.new(:email => "admin", :password => "choochoo")
u.save(false) # bypass validation