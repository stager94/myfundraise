set :domain, '185.74.254.17'
server '185.74.254.17', :app, :web, :db, primary: true

set :branch, 'master'

set :rails_env, 'production'

role :web, domain
role :app, domain
role :db,  domain, primary: true
