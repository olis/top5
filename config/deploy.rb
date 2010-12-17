default_run_options[:pty] = true
 
set :application, "top5"
 
ssh_options[:port] = 22
ssh_options[:paranoid] = false
ssh_options[:username] = 'webmaster'
ssh_options[:forward_agent] = true
 
set :repository,  "git@github.com:olis/top5.git"
set :scm, "git"
set :scm_user, "olis"
set :scm_passphrase, "ci6bnapk"
set :scm_verbose, true
set :deploy_via, :remote_cache
 
if ENV['RAILS_ENV'] == 'production'
  set :rails_env, "production"
  set :branch, "master"
  set :deploy_to, "/www/#{application}"
else #staging
  set :rails_env, "staging"
  set :branch, "staging"
  set :deploy_to, "/www/#{application}-staging"
end
 
role :app, "cyan.yum.de"
role :web, "cyan.yum.de"
role :db,  "cyan.yum.de", :primary => true
 
namespace :deploy do
 
 desc "Restart passenger"
 task :restart, :roles => :app do
   run "cd #{current_path} && touch tmp/restart.txt"
 end
 
 [:start, :stop].each do |t| 
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end 
  end
 
end
 
after "deploy:setup", "deploy:change_owner"
after "deploy:symlink", "deploy:symlink_shared"
set :chown, "chown -R webmaster:www-data #{deploy_to}"
set :symlink_agency_logos, "ln -s #{deploy_to}/shared/agency_logos #{current_path}/public/agency_logos"
set :symlink_client_logos, "ln -s #{deploy_to}/shared/client_logos #{current_path}/public/client_logos"
set :symlink_case_images, "ln -s #{deploy_to}/shared/case_images #{current_path}/public/case_images"
set :symlink_asset_binaries, "ln -s #{deploy_to}/shared/asset_binaries #{current_path}/public/asset_binaries"
set :symlink_ftp, "ln -s #{deploy_to}/shared/ftp #{current_path}/public/ftp"
 
namespace :deploy do
  desc "Sets the right owner"
  task :change_owner, :roles => :app do
    run chown
  end
end

namespace :deploy do
 desc "Symlink application specific shares"
 task :symlink_shared, :roles => :app do
   run symlink_agency_logos
   run symlink_client_logos
   run symlink_case_images
   run symlink_asset_binaries
   run symlink_ftp
 end
end