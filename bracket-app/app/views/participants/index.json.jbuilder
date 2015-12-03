json.array!(@participants) do |participant|
  json.extract! participant, :id, :Name
  json.url participant_url(participant, format: :json)
end
