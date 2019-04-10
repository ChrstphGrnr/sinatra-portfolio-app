require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#we use this to be able to use 'patch' and 'delete' actions

use Rack::MethodOverride


# here we will add other controlers with 'use'

use UsersController
use TrailsController

run ApplicationController

