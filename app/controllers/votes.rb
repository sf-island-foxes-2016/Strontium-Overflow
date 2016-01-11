

post '/votes' do #post perform create or replace vote (no point in update since single field)
  @user_id = session[:user_id]
  @vote = Vote.new(
    votable_id: params[:votable_id],
    votable_type: params[:votable_type],
    approval: params[:approval],
    user_id: @user_id
    )
  # if Vote.find_by(user_id: @user_id, votable_id: @vote.votable_id, votable_type: @vote.votable_type) == nil
  #     @vote.save
  #   elsif Vote.find_by(user_id: @user_id, votable_id: @vote.votable_id, votable_type: @vote.votable_type) != nil
  #     Vote.find_by(user_id: @user_id, votable_id: @vote.votable_id, votable_type: @vote.votable_type).destroy
  #
  @vote.save
  #
   # || Vote.find_by(user_id: @user_id, votable_id: @vote.votable_id).votable_type == @vote.votable_type

  pathnum = @vote.votable_id
    if @vote.votable_type == "Answer"
      ans = Answer.find(pathnum)
      pathnum = ans.question.id
    end

  redirect "/questions/#{pathnum}"
end


