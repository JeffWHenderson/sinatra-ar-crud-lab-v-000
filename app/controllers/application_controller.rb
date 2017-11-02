require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "go to /posts/new"
  end

  get "/posts/:id" do
    "200"
    
    # erb :'show'
  end

  get '/posts/new' do
    erb :'new'
  end

  post '/posts' do
    #@data = params
    @post = Post.create(params)   #I can just load params(name: params[:post_name], content: params[:post_content])
    @post.save
    #"#{post.name} \n #{post.content}"
    redirect  :'/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :'index'
  end

end
