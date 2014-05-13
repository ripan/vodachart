json.array!(@orders) do |order|
  json.extract! order, :id, :alien_id, :product_id, :stage_id, :closed_at, :is_closed, :setup_charge, :monthly_revenue
  json.url order_url(order, format: :json)
end
