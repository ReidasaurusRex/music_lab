require 'sinatra'
require 'sinatra/activerecord'
require 'pg'
require 'better_errors'
require './models/artist.rb'
require 'pry'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

get '/' do
  redirect '/artists'
end

get '/artists' do
  @artists = Artist.all
  erb :index
end

get '/artists/new' do
  erb :new
end

get '/artists/:id' do
  @artist = Artist.find_by(id: params[:id])
  erb :show
end

get '/artists/:id/edit' do
  @artist = Artist.find_by(id: params[:id])
  erb :edit
end

post '/artists' do 
  Artist.create params
  redirect '/artists'
end

put '/artists/:id' do
  artist = Artist.find_by(id: params[:id])
  artist.name = params[:name]
  artist.genre = params[:genre]
  artist.save
  redirect "artists/#{artist.id}"
end

delete '/artists/:id' do
  binding.pry
  artist = Artist.find_by(id: params[:id])
  artist.destroy
  redirect '/artists'
end