set :application, "amsblog"
set :repository,  "git://github.com/howshouldiknow/Exist.git"

set :scm, :git


role :web, "175.41.165.67"                          # Your HTTP server, Apache/etc
role :app, "175.41.165.67"                          # This may be the same as your `Web` server
role :db,  "175.41.165.67", :primary => true # This is where Rails migrations will run


set :user, "amboy"
set :deploy_to, "/mnt/webapps/#{application}"

set :use_sudo, false

namespace :deploy do

  desc "setup app via simple script"
  task :config_app do
    run "/ecclabs/ecc_create_app.rb #{application}"
  end

  after 'deploy:setup', 'deploy:config_app'


  task :restart do
     run "/ecclabs/ecc_restart_app.sh #{application}"
  end

end

namespace :utils do
  task :tail_log do
    run "tailf #{deploy_to}/current/log/production.log"
  end
end
