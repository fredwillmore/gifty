json.array!(@admin_gifts) do |admin_gift|
  json.extract! admin_gift, :id
  json.url admin_gift_url(admin_gift, format: :json)
end
