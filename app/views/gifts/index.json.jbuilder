json.array!(@gifts) do |gift|
  json.extract! gift, :giver_id, :receiver_id, :merchant_id, :amount, :amount
  json.url gift_url(gift, format: :json)
end
