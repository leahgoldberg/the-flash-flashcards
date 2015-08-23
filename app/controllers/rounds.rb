post '/rounds' do
  @round = Round.new(params[:round])
  @round.player = current_user
  if @round.save!
    redirect "/round/#{@round.id}/new"
  else
    redirect "/"
  end
end

get "/round/:id/new" do
  round = Round.find_by(id: params[:id])
  card = round.new_card
  redirect "/round/#{round.id}/card/#{card.id}"
end

get "/round/:id" do
  @round = Round.find_by(id: params[:id])
  @player = @round.player
  @deck = @round.deck
  @guesses = @round.guesses
  sql = "select count(*) from (select count(*) as cnt from guesses where round_id = #{@round.id} group by card_id having count(*) = 1) as counts;"
  @first_guesses = ActiveRecord::Base.connection.execute(sql).getvalue(0,0)
  erb :"/rounds/show"
end
