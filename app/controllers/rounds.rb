post '/rounds' do
  # binding.pry
  @round = Round.new(params[:round])
  @round.player = current_user
  if @round.save
    redirect "/round/#{@round.id}"
  else
    redirect "/"
  end
end
