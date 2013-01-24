# desc "Explaining what the task does"
# task :auth do
#   # Task goes here
# end
# 
# 
desc "Create a default user as admin"
task :create_user, [:email, :password] => [:environment] do |t, args|
  puts "Creating new user with #{:email} and password *** !"
  u = User.create({email: args.email, password: args.password, password_confirmation: args.password})
  if u.save!
    puts "User created!"
  else
    puts "Error"
  end
end
