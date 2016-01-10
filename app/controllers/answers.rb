get '/answers/new/question/:id' do #get create form
  @question = Question.find(params[:id])
  erb :'answer/new'
end

post '/answers' do #post create form to perform create
  @answer = Answer.new(params[:answer])
  puts params
  @answer.user_id = session[:user_id]
  @answer.save
  redirect "/questions/#{@answer.question_id}"
end

get '/answers/:id/edit' do # get update form
  @answer = Answer.find(params[:id])
  if session[:user_id] == @answer.user.id
  erb :'answer/edit'
  else
  store_return_to
  redirect '/users/login/2'
end
end

put '/answers/:id' do # put update form to perform update
  @answer = Answer.find(params[:id])
  @answer.update_attributes(params[:answer])
  redirect "/questions/#{@answer.question_id}"
end




