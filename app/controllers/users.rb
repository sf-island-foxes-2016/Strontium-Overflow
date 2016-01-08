get '/users/new' do #get create form
  erb :'user/new'
end

post '/users' do #post create form to perform create
    @user = User.new(name: params[:name], email: params[:email])
    redirect '/tal' if @user.name == "Tal"
    redirect '/tay' if @user.name == "Taylor Swift"
    redirect '/shall' if @user.name == "David"
    redirect '/race' if @user.name == "Speed Racer"
    @user.password = params[:password]
    if @user.save!
      "You successfully created an account"
    end
    session[:user_id] = @user.id
    redirect '/'
end

get '/users/login' do
  erb :'user/login'
end

get '/users/login/1' do
  @error_true = true
  erb :'user/login'
end

post '/users/login' do
  user = User.find_by(email: params[:email])
  if user && user.password == (params[:password])
    session[:user_id] = user.id
    "You are logged in."
    redirect '/questions'
  else
    redirect '/users/login/1'
  end
end

get '/users/logout' do
  redirect '/users/login' unless session[:user_id]
  session.delete(:user_id)
  redirect '/'
end

get '/users/:id/edit' do # get update form
  redirect '/users/login' unless session[:user_id]
  # need id via params
  erb :'user/update'
end

put '/users/:id' do # put update form to perform update

end

delete '/users/:id' do # delete

end
