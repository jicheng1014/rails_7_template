# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "my_app_name"
set :repo_url, "git@example.com:me/my_repo.git"


set :nvm_type, :user
set :nvm_node, 'v14.16.0'
set :nvm_map_bins, %w[node npm yarn]


set :rvm_ruby_version, '3.0.2' # Defaults to: 'default'
set :sitemap_roles, :app
set :sidekiq_processes, 2

set :puma_phased_restart, true
set :puma_init_active_record, true

set :sidekiq_roles, :sidekiq # 可指定
# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/application.yml', 'config/master.key', 'config/credentials.yml.enc'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'node_modules', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/uploads', 'public/assets', 'public/packs'




# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
