get '/comments/new/question/:id' do #get create form
  @question = Question.find(params[:id])
  if session[:user_id] == nil
    store_return_to
    redirect '/users/login/1'
    else
    @user_id = session[:user_id]
  erb :'comment/new_to_question'
end
end

get '/comments/new/answer/:id' do #get create form
  @answer = Answer.find(params[:id])
  if session[:user_id] == nil
    store_return_to
    redirect '/users/login/1'
    else
    @user_id = session[:user_id]
  erb :'comment/new_to_answer'
end
end

post '/comments' do #post create form to perform create
  @comment = Comment.new(params[:comment])
  @comment.user_id = session[:user_id]
  @comment.save
  redirect '/shall' if @comment.text.include?("game")
  redirect "/questions/#{@comment.commentable_id}" if @comment.commentable_type == "Question"
  puts @comment.inspect
  redirect "/questions/#{Answer.find(@comment.commentable_id).question_id}"
end

get '/comments/:id/edit' do # get update form
  @comment = Comment.find(params[:id])
  if session[:user_id] == @comment.user.id
  erb :'comment/update'
else
  store_return_to
  redirect '/users/login/2'
end
end

put '/comments/:id' do # put update form to perform update
  @comment = Comment.find(params[:id])
  @comment.update_attributes(params[:comment])
  redirect "/questions/#{@comment.question_id}"
end
