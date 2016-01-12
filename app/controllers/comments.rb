get '/comments/new/comment/:id' do #get create form
  @post = Post.find(params[:id])
  if session[:user_id] == nil
    store_return_to
    redirect '/users/login/1'
  else
    @user_id = session[:user_id]
  erb :'comment/new'
end
end

post '/comments' do #post create form to perform create
  @comment = Comment.new(params[:comment])
  @comment.user_id = session[:user_id]
  @comment.save
  redirect "/posts/#{@comment.post_id}"
end

# get '/answers/:id/edit' do # get update form
#   @answer = Answer.find(params[:id])
#   if session[:user_id] == @answer.user.id
#   erb :'answer/edit'
#   else
#   store_return_to
#   redirect '/users/login/2'
# end
# end

put '/answers/:id' do # put update form to perform update
  @answer = Answer.find(params[:id])
  @answer.update_attributes(params[:answer])
  redirect "/questions/#{@answer.question_id}"
end




