json.array!(@contact_lists) do |contact_list|
  json.extract! contact_list, :id, :user_id, :friend_id, :friend_type
  json.url contact_list_url(contact_list, format: :json)
end
