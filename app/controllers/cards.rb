get "/round/:round_id/card/:id" do
  @card = Card.find_by(id: params[:id])
  erb :"cards/show"
end
