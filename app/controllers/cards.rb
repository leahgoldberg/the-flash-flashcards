get "/round/:round_id/card/:id" do
  @card = Card.find_by(id: params[:id])
  @round = Round.find_by(id: params[:round_id])
  erb :"cards/show"
end

get '/decks/:id/cards/new' do
  params[:id]
end
