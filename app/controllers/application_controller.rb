require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    #@data = params
    post = Post.create(name: params[:post_name], content: params[:post_content])
    post.save
    "#{post.name} \n #{post.content}"
  end

  get '/posts' do
    "#{Post.all}"
  end
end
