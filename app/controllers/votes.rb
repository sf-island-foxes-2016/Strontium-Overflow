post '/votes' do #post perform create or replace vote (no point in update since single field)
  @vote = Vote.new(params[:answer])
  @vote.user_id = session[:user_id]
  @vote.save
  redirect "/questions/:#{@vote.question_id}"
end

