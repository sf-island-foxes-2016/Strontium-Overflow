get '/users/new' do #get create form
  erb :'user/new'
end

post '/users' do #post create form to perform create
    # if params[:email] == User.find_by(email: params[:email]).email
    #   "Sorry, this email already exists"
    # elsif
    @user = User.new(name: params[:name], email: params[:email])
    @user.password = params[:password]
    if @user.save!
      "You successfully created an account"
    end
    session[:user_id] = @user.id
    redirect '/'
  # end
end

get '/users/login' do
  # @error_no_right_to_post = false
  # @error_true = false
  erb :'user/login'
end

get '/users/login/:id' do
  @error_true = true
  erb :'user/login'
end

get '/users/login/2' do
  @error_no_right_to_post = true
  erb :'user/login'
end

post '/users/login' do
  user = User.find_by(email: params[:email])
  if user && user.password == (params[:password])
    session[:user_id] = user.id
    "You are logged in."
    # p session[:return_to]
    redirect '/'
  elsif user && user.password == (params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/users/login'
  end
end

get '/users/logout' do
  redirect '/users/login' unless session[:user_id]
  session.delete(:user_id)
  redirect '/'
end

# get '/users/:id/edit' do # get update form
#   redirect '/users/login' unless session[:user_id]
#   # need id via params
#   erb :'user/update'
# end

get '/users/:id' do # put update form to perform update
  if session[:user_id]
    @user = User.find(session[:user_id])
    @posts = Post.where(user_id: @user.id)
    @comments = Comment.where(user_id: @user.id)
  erb :'/user/user_info'
  else
    redirect '/'
end
end

delete '/users/:id' do # delete

end
