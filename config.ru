# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

use Rack::Cors do
  allow do
    origins 'localhost:3000', '127.0.0.1:3000', /\Ahttp:\/\/192\.168\.0\.\d{1,3}(:\d+)?\z/
  end

  allow do
    origins '*'
    resource '/public/*', :headers => :any, :methods => :get
  end
end

run Rails.application
