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
