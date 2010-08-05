set :application, "qifood" 
set :repository,  "git@github.com:dominikweifieg/QiFood.git"
set :domain, "qifood.eu"
set :use_sudo, false
# If you have previously been relying upon the code to start, stop 
# and restart your mongrel application, or if you rely on the database
# migration code, please uncomment the lines you require below

# If you are deploying a rails app you probably need these:

# load 'ext/rails-database-migrations.rb'
# load 'ext/rails-shared-directories.rb'

# There are also new utility libaries shipped with the core these 
# include the following, please see individual files for more
# documentation, or run `cap -vT` with the following lines commented
# out to see what they make available.

# load 'ext/spinner.rb'              # Designed for use with script/spin
# load 'ext/passenger-mod-rails.rb'  # Restart task for use with mod_rails
# load 'ext/web-disable-enable.rb'   # Gives you web:disable and web:enable

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
# see a full list by running "gem contents capistrano | grep 'scm/'"
set :user, "deployer"

ssh_options[:forward_agent] = true
set :branch, "master"
set :deploy_via, :remote_cache

set :rake, "/opt/ruby/bin/rake"

role :web, domain
role :app, domain
role :db, domain, :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    #do nothing
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

after 'deploy:update_code', 'deploy:finalize_update_code'
after 'deploy:rollback:revision', 'deploy:finalize_update_code'

desc "Finalize update code"
deploy.task :finalize_update_code do
  run "ln -s #{shared_path}/aliment_photos #{current_release}/public/aliment_photos"
  run "ln -s #{shared_path}/user_photos #{current_release}/public/user_photos"
end
