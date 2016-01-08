get '/comments/new/question/:id' do #get create form
  @question = Question.find(params[:id])
  erb :'comment/new_to_question'
end

post '/comments' do #post create form to perform create
  @comment = Comment.new(params[:comment])
  @comment.user_id = session[:user_id]
  @comment.save
  redirect "/questions/#{@comment.question_id}"
end

get '/comments/:id/edit' do # get update form
  @comment = Comment.find(params[:id])
  erb :'comment/update'
end

put '/comments/:id' do # put update form to perform update
  @comment = Comment.find(params[:id])
  @comment.update_attributes(params[:comment])
  redirect "/questions/#{@comment.question_id}"
end
