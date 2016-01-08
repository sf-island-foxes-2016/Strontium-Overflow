get '/answers/new/question/:id' do #get create form
  @question = Question.find(params[:id])
  erb :'answer/create'
end

post '/answers' do #post create form to perform create
  @answer = Answer.new(params[:answer])
  @answer.user_id = session[:user_id]
  @answer.question_id = @question.id
  @answer.save
  puts "Answer contents is #{@answer.inspect}"
  puts "AQID is #{@answer["question_id"]}"
  puts "AQ is #{@answer["question"]}"
  puts "AQQID is #{@answer.question.question_id}"
  redirect "/questions/#{@answer.question_id}"
end

get '/answers/:id/edit' do # get update form
  @answer = Answer.find(params[:id])
  erb :'answer/update'
end

put '/answers/:id' do # put update form to perform update
  @answer = Answer.find(params[:id])
  @answer.update_attributes(params[:answer])
  redirect "/questions/#{@answer.question_id}"
end




