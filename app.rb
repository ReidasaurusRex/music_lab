require 'sinatra'
require 'sinatra/activerecord'
require 'pg'
require 'better_errors'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

get '/' do
  redirect '/artists'
end

get '/artists' do
  
end