get '/questions' do #list all
  @questions = Question.all
  erb :'question/show'
end

get '/questions/new' do #get create form (must precede the /:id route which will catch all)
  erb :'question/create'
end

get '/questions/:id' do #list one
  @question = Question.find(params[:id])
  erb :'question/show_one'
end

post '/questions' do #post create form to perform create
  @question = Question.new(params[:question])
  @question.save
  redirect "/questions/:#{@question.id}"
end

get '/questions/:id/edit' do # get update form
  @question = Question.find(params[:id])
  erb :'question/update'
end

put '/questions/:id' do # put update form to perform update
  @question = Question.find(params[:id])
  @question.update_attributes(params[:question])
  redirect "/questions/#{@question.id}"
end

