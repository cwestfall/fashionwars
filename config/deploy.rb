set :application, "fashionwars"

set :repository, "git@github.com:cwestfall/fashionwars.git"
set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache
set :git_enable_submodules, 1


role :web, "fashionwars.ihg-ecommerce.com"                          # Your HTTP server, Apache/etc
role :app, "fashionwars.ihg-ecommerce.com"                          # This may be the same as your `Web` server
role :db,  "fashionwars.ihg-ecommerce.com", :primary => true        # This is where Rails migrations will run

# server details
default_run_options[:pty] = true 
set :rails_env, "production"
set :deploy_to, "/var/www/html/fashionwars"
set :deploy_via, :remote_cache
set :user, "ec2-user"
set :runner, "passenger"

set :use_sudo, false
ssh_options[:forward_agent] = true
ssh_options[:keys] = %w(/Users/cwestfall/ec2_keys/fashionwarskey.pem)  

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(release_path, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end

  task :install, :roles => :app do
    run "#{try_sudo} cd #{release_path} && bundle install"

    on_rollback do
      if previous_release
        run "#{try_sudo} cd #{previous_release} && bundle install"
      else
        logger.important "no previous release to rollback to, rollback of bundler:install skipped"
      end
    end
  end

  task :bundle_new_release, :roles => :db do
    bundler.create_symlink
    bundler.install
  end
end

after "deploy:rollback:revision", "bundler:install"
after "deploy:update_code", "bundler:bundle_new_release"