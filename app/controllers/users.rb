get '/users/new' do #get create form
  erb :'user/new'
end

post '/users' do #post create form to perform create
    # if params[:email] == User.find_by(email: params[:email]).email
    #   "Sorry, this email already exists"
    # elsif
    @user = User.new(name: params[:name], email: params[:email])
    redirect '/tal' if @user.name[0..2] == "Tal"
    redirect '/tay' if @user.name == "Taylor Swift"
    redirect '/race' if @user.name == "Speed Racer"
    @user.password = params[:password]
    if @user.save!
      "You successfully created an account"
    end
    session[:user_id] = @user.id
    redirect '/'
  # end
end

get '/users/login' do
  @error_no_right_to_post = false
  @error_true = false
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
  if user && user.password == (params[:password]) && params[:error_variable] == "redirect"
    session[:user_id] = user.id
    "You are logged in."
    # p session[:return_to]
    redirect session[:return_to]
  elsif user && user.password == (params[:password]) && params[:error_variable] == ""
    session[:user_id] = user.id
    redirect 'questions'
  else
    redirect '/users/login/1'
  end
end

# post '/users/login/1' do
#   user = User.find_by(email: params[:email])
#   if user && user.password == (params[:password])
#     session[:user_id] = user.id
#     "You are logged in."
#     # p session[:return_to]
#     redirect 'questions'
#   else
#     redirect '/users/login/1'
#   end
# end

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
