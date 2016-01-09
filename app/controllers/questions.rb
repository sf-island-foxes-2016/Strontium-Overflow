get '/questions' do #list all
  @questions = Question.all
  erb :'question/index'
end

get '/questions/new' do #get create form (must precede the /:id route which will catch all)
  redirect '/users/login/1' unless session[:user_id]
  @user_id = session[:user_id]
  erb :'question/new'
end

post '/questions/new' do
  @question = Question.new(params[:question])
  @question.save
  redirect "/questions/#{@question.id}"
end

get '/questions/:id' do #list one
  @question = Question.find(params[:id])
  erb :'question/show'
end

# post '/questions' do #post create form to perform create
#   @question = Question.new(params[:question])
#   @question.save
#   redirect "/questions/#{@question.id}"
# end

get '/questions/:id/edit' do # get update form
  @question = Question.find(params[:id])
  if session[:user_id] == @question.user.id
  erb :'question/edit'
else
  redirect '/users/login/2'
end
end

put '/questions/:id' do # put update form to perform update
  @question = Question.find(params[:id])
  @question.update_attributes(params[:question])
  redirect "/questions/#{@question.id}"
end


# <%= :'question/show_one', :locals => { :question => @question } %>
