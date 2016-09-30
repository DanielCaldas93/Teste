json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :data, :valorTotal
  json.url pedido_url(pedido, format: :json)
end
