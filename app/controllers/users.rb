get '/users/new' do #get create form
  erb :user_create
end

post '/users' do #post create form to perform create

end

get '/users/:id/edit' do # get update form
  # need id via params
  erb :user_update
end

put '/users/:id' do # put update form to perform update

end

delete '/users/:id' do # delete

end
