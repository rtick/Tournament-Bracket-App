json.array!(@teams) do |team|
  json.extract! team, :id, :Name
  json.url team_url(team, format: :json)
end
