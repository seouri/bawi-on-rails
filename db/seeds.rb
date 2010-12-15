u = User.new(:email => "admin@CHANGE-TO-YOUR-EMAIL.COM", :password => "choochoo")
u.save(false) # bypass validation
