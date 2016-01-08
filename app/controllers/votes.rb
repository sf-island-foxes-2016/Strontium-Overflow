

post '/votes' do #post perform create or replace vote (no point in update since single field)
  user_id = session[:user_id]
  @vote = Vote.new(
    votable_id: params[:votable_id],
    votable_type: params[:votable_type],
    approval: params[:approval],
    user_id: user_id
    )

  @vote.save


  redirect "/questions/#{@vote.votable_id}"
end

