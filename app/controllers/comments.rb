get '/comments/new' do #get create form
  erb :comment_create
end

post '/comments' do #post create form to perform create
  @comment = Comment.new(params[:comment])
  @comment.user_id = session[:user_id]
  @comment.save
  redirect "/questions/:#{comment.question_id}"
end

get '/comments/:id/edit' do # get update form
  @comment = Comment.find(params[:id])
  erb :comment_update
end

put '/comments/:id' do # put update form to perform update
  @comment = Comment.find(params[:id])
  @comment.update_attributes(params[:comment]
  redirect "/questions/:#{comment.question_id}"
end
