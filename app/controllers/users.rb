get '/users/new' do #get create form
  erb :user_create
end

post '/users' do #post create form to perform create
    @user = User.new(name: params[:name], email: params[:email])
    @user.password = params[:password]
    if @user.save!
      "#{@user.name} with email address #{@user.email} has been successfully registered."
      ## Alternatively, we can redirect to /questions or other page as success.
    else
      "Sorry, the system could not register this account."
    end
end

get '/users/login' do
  erb :user_login
end

post '/users/login' do
  user = User.find_by(email: params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/questions'
  else
    erb :user_login
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
  erb :user_update
end

put '/users/:id' do # put update form to perform update

end

delete '/users/:id' do # delete

end
