get '/answers/new' do #get create form
  erb :'answer/create'
end

post '/answers' do #post create form to perform create
  @answer = Answer.new(params[:answer])
  @answer.user_id = session[:user_id]
  @answer.save
  redirect "/questions/:#{answer.question_id}"
end

get '/answers/:id/edit' do # get update form
  @answer = Answer.find(params[:id])
  erb :'answer/update'
end

put '/answers/:id' do # put update form to perform update
  @answer = Answer.find(params[:id])
  @answer.update_attributes(params[:answer])
  redirect "/questions/:#{answer.question_id}"
end




