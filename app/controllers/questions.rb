get '/questions' do #list all
  erb :questions_show
end

get '/questions/new' do #get create form (must precede the /:id route which will catch all)
  erb :question_create
end

get '/questions/:id' do #list one
  erb :question_show_one
end

post '/questions' do #post create form to perform create

  redirect '/questions/:id' #need to code how to get back to this question
end

get '/questions/:id/edit' do # get update form
  # need id via params
  erb :question_update
end

put '/questions/:id' do # put update form to perform update

  redirect '/questions/:id' #need to code how to get back to this question
end

