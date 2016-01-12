

get '/posts' do #list all
  @user = User.find(session[:user_id]) if session[:user_id]
  @posts = Post.all
  erb :'post/index'
end

get '/posts/new' do #get create form (must precede the /:id route which will catch all)
  if session[:user_id] == nil
    store_return_to
    redirect '/users/login/1'
  else
    @user_id = session[:user_id]
    erb :'post/new'
  end
end

post '/posts/new' do
  @post = Post.new(params[:post])
  @post.save
  redirect "post/#{@post.id}"
end

get '/posts/:id' do #list one
  @user = User.find(session[:user_id]) if session[:user_id]
  @post = Post.find(params[:id])
  erb :"post/show"
end

get '/post/:id/edit' do # get update form
  @post = Post.find(params[:id])
  if session[:user_id] == @post.user.id
    erb :'post/edit'
  else
    redirect '/users/login/2'
  end
end

put '/posts/:id' do # put update form to perform update
  @post = Post.find(params[:id])
  @post.update_attributes(params[:question])
  redirect "/posts/#{@post.id}"
end
