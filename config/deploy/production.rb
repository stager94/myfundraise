set :domain, '46.101.230.46'
server '46.101.230.46', :app, :web, :db, primary: true

set :branch, 'master'

set :rails_env, 'production'

role :web, domain
role :app, domain
role :db,  domain, primary: true
