get '/answers/new' do #get create form
  erb :answer_create
end

post '/answers' do #post create form to perform create

end

get '/answers/:id/edit' do # get update form
  # need id via params
  erb :answer_update
end

put '/answers/:id' do # put update form to perform update

end




