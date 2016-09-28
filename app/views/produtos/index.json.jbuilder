json.array!(@produtos) do |produto|
  json.extract! produto, :id, :nome, :descricao, :quantidade, :valorUnit, :imagem
  json.url produto_url(produto, format: :json)
end
