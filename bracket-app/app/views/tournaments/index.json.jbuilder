json.array!(@tournaments) do |tournament|
  json.extract! tournament, :id, :Name
  json.url tournament_url(tournament, format: :json)
end
