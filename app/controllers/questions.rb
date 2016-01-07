get '/questions' do #list all
  @questions = Question.all
  erb :questions_show
  erb :index
end

get '/questions/new' do #get create form (must precede the /:id route which will catch all)
  erb :question_create
end

get '/questions/:id' do #list one
  @question = Question.find(params[:id])
  erb :question_show_one
end

post '/questions' do #post create form to perform create
  @question = Question.create(
    title = params[:title],
    text = params[:text],
    user_id = 3 #need current user from session
    )
  redirect "/questions/:#{@question.id}"
end

get '/questions/:id/edit' do # get update form
  @question = Question.find(params[:id])
  erb :question_update
end

put '/questions/:id' do # put update form to perform update
  @question = Question.find(params[:id])
  @question.title = (params[:title])
  @question.text = (params[:text])
  redirect "/questions/:#{@question.id}"
end

