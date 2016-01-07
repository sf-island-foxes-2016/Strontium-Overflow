get '/comments/new' do #get create form
  erb :comment_create
end

post '/comments' do #post create form to perform create

end

get '/comments/:id/edit' do # get update form
  # need id via params
  erb :comment_update
end

put '/comments/:id' do # put update form to perform update

end

delete '/comments/:id' do # delete

end
