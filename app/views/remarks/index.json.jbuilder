json.array!(@remarks) do |remark|
  json.extract! remark, :id, :user_id, :topic, :description
  json.url remark_url(remark, format: :json)
end
