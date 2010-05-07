task :name do
  puts "nasa test.rake ang puts nato"
end

task :sanitize_email => :environment do
  user.all.each do |user|
    user.email = user.email + "OK"
    user.save
  end
end

task :show_users => [:environment, :sanitize_email] do
  user.all.map {|u| puts u.email}
end

task :show_user => :environment do
  user.find(ARGV[0])
end

