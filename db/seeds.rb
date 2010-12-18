u = User.new(:email => "admin@a.com", :password => "choochoo")
u.save(false) # bypass validation
