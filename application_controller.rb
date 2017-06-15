require 'bundler'
Bundler.require
require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/song' do
  search_param = params[:search]
  @html_code = find_image(search_param)
  erb :results
  end
  
  # post '/' do
  #   @img = "https://static.pexels.com/photos/126407/pexels-photo-126407.jpeg"
  #   @status = "active"
  #   erb :index
  # end
end
